module GettextTestLog
  extend self
  SEPERATOR = "\nNEXT-WORD\n"

  # write to a given file, which msgids where found
  # in the `rake updatepo` recogniseable format _("msgid")
  def write_test_log(storage_file,options={})
    messages = messages_from_test_run
    if excluded = options[:exclude_msgids_in_po_files]
      messages -= msgids_in_po_files(excluded)
    end
    store_messages(messages,storage_file)
  end

  # call this inside your spec_helper.rb
  # to activate test message storage
  def activate_test_logging
    if ENV['LOG_GETTEXT']
      Spec::Runner.configure do |config|
        #TODO only call after the 'last' test was executed
        config.after(:all) do
          File.open(ENV['LOG_GETTEXT'],'w') do |f|
            f.puts GettextTestLog.cached_msgids * SEPERATOR
          end
        end
      end
    end
  end

  # all msgids that are cached atm
  def cached_msgids
    GetText.module_eval('@@__cache_msgids').keys.map{|target,locale,message|message}.uniq
  end

private

  def messages_from_test_run
    logfile = 'tmp_gettext_test_log.txt'
    run_tests(logfile)
    ids = used_msgids(logfile)
    `rm #{logfile}`
    ids
  end

  def used_msgids(logfile)
    File.read(logfile).split(/#{SEPERATOR}/m).map(&:strip).reject(&:blank?).uniq
  end

  def run_tests(logfile)
    ENV['LOG_GETTEXT']=logfile
    Rake::Task["spec"].invoke rescue nil
  end

  def msgids_in_po_files(files)
    [*files].map{|file| messages_from_po_file(file).keys}.flatten
  end

  #returns a hash of all msgid => msgstr
  def messages_from_po_file(file)
    require 'gettext'
    require 'gettext/poparser'
    require 'gettext/mo'
    data = MOFile.new
    GetText::PoParser.new.parse(File.read(file),data)
    data
  end

  def store_messages(messages,file)
    File.open(file,'w') do |f|
      f.puts messages.uniq.sort.map{|message| %Q[_("#{message}")].gsub("\n","\\n")} * "\n"
    end
  end
end