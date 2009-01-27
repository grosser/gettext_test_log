Problem
=======
 - Finding all translations by parsing is impossible for dynamic calls
 - often even static calls are not found
 - some file formats do not have a gettext parser

Solution
========
 - log all translations during test execution
 - write them to an parseable temp file
 - use updatepo / makemo as usual
 - missing translation = missing test, write tests!

Usage
=====
  Create a rake task:
    #lib/tasks/gettext_test_log.rake
    desc "write all msgids used into testlog_phrases.rb"
    task :gettext_test_log => :environment do
      #place the file should somewhere your updatepo is searching
      GettextTestLog::write_test_log("locale/_po/testlog_phrases.rb",
        :exclude_msgids_in_po_files=>[
          'vendor/plugins/gettext_localize/po/de/gettext_localize.po',
          '/usr/lib/ruby/gems/1.8/gems/gettext-1.93.0/po/de/rails.po'
        ]
      )
    end

  Add to your spec_helper:
    #spec/spec_helper.rb
    GettextTestLog::activate_test_logging

  Run:
    rake gettext_test_log
    rake updatepo  #find new translations
    #fill newly found translations
    rake makemo #write translations

Install
=======
 - As Rails plugin: `script/plugin install git://github.com/grosser/gettext_test_log.git `
 - As gem: `sudo gem install grosser-gettext_test_log --source http://gems.github.com/`
 - As gem from source: `git clone git://github.com/grosser/gettext_test_log.git`,`cd gettext_test_log`,`rake manifest`,`rake install`

Examples output
===============
    #locale/_po/testlog_phrases.rb
    _("Add to favorites")
    _("Added a subtitle to %{name}")
    _("Additional Information")
    _("Address")
    ...

Author
======
Michael Grosser  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...  