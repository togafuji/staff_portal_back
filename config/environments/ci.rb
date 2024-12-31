Rails.application.configure do
  config.active_record.sqlite3.represent_boolean_as_integer = true if Rails.env.test?
end

Rails.application.configure do
config.active_record.database_selector = {
  delay: 2.seconds,
}
end

Rails.application.configure do
  config.active_record.adapter = 'mysql2'
end
