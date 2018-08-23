namespace :ignored_removed_columns do
  desc "Find removed or typo columns defined in ignored_columns"
  task :check, [:klass_name] => :environment do |task, args|
    args.with_defaults(klass_name: 'ActiveRecord::Base')
    klass = args[:klass_name].safe_constantize
    unless klass
      exit 2
    end

    Rails.application.eager_load!
    model_classes = ActiveSupport::DescendantsTracker.descendants(klass)

    found_columns = false
    model_classes.each do |model_class|
      next if model_class.abstract_class?

      ignored_columns = model_class.ignored_columns
      actual_columns = model_class.connection.schema_cache.columns_hash(model_class.table_name).keys

      removed_or_typo_columns = ignored_columns - actual_columns

      next if removed_or_typo_columns.empty?

      unless found_columns
        puts "Found removed or typo columns defined in ignored_columns"
        puts "--------------------------------------------------------"
        found_columns = true
      end

      puts "#{model_class}:"
      removed_or_typo_columns.each do |column|
        puts "  - #{column}"
      end
    end

    if found_columns
      exit 1
    end

    puts "ok"
    exit 0
  end
end
