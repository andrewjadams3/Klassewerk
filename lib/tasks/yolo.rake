desc 'Resets and reseeds the database'
task :yolo => ["db:drop", "db:create", "db:migrate", "db:seed"]