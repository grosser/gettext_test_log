Problem
=======
 - Finding all translations by parsing is impossible for dynamic calls
 - often even static calls are not found
 - some file formats do not have a gettext parser

Solution
========
 - log all translations during test execution
 - write them to an parseable temp file
 - use gettext:find / gettext:pack as usual
 - missing translation = missing test, write tests!

Usage
=====
  Create a rake task:
    #lib/tasks/gettext_test_log.rake
    desc "write all msgids used into testlog_phrases.rb"
    task :gettext_test_log => :environment do
      #place the file should somewhere your updatepo is searching
      GettextTestLog::write_test_log("locale/testlog_phrases.rb",
        :exclude_msgids_in_po_files=>[
          'some_po_file_that_contains_translations_you_do_not_need.po'
        ]
      )
    end

  Add to your spec_helper:
    #spec/spec_helper.rb
    GettextTestLog::activate_test_logging

  Run:
    rake gettext_test_log
    rake gettext:find  #find new translations
    #fill newly found translations
    rake gettext:pack #write translations

Install
=======
 - As Rails plugin: `script/plugin install git://github.com/grosser/gettext_test_log.git `
 - As gem: `sudo gem install grosser-gettext_test_log -s http://gems.github.com/`

Examples output
===============
    #locale/testlog_phrases.rb
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