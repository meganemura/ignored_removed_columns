module IgnoredRemovedColumns
  class Railtie < ::Rails::Railtie
    rake_tasks do
      load 'tasks/ignored_removed_columns_tasks.rake'
    end
  end
end
