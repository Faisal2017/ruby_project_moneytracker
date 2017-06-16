require_relative('../db/sql_runner.rb')

class Tag

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @tag_name = options['tag_name']
  end

  def save
    sql = "INSERT INTO tags (tag_name) VALUES ('#{tag_name}' RETURNING *)"
    result = sql_runner.run(sql)
    id = result.first['id']
    @id = id 
  end

end  