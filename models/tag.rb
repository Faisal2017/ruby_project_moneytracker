require_relative('../db/sql_runner.rb')
require('pry-byebug')

class Tag

  attr_reader :id, :tag_name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @tag_name = options['tag_name']
  end

  def save()
    sql = "INSERT INTO tags (tag_name) VALUES ('#{@tag_name}') RETURNING *"
    result = SqlRunner.run(sql)
    id = result.first['id']
    @id = id.to_i() 
  end

  def sum_by_tag
    sql = "SELECT * FROM transactions WHERE tag_id = #{@id}"
    results = SqlRunner.run(sql)
    return results.sum { |transaction_hash| transaction_hash["amount"].to_i() }
  end

  def Tag.find(id)
    sql = "SELECT * FROM tags WHERE id = #{id}"
    results = SqlRunner.run(sql).first()
    return Tag.new(results)
  end

  def Tag.all()
    sql = "SELECT * FROM tags"
    result_hashes = SqlRunner.run(sql)
    return result_hashes.map { |result_hash| Tag.new (result_hash) }
  end

  def Tag.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def Tag.destroy(id)
    sql = "DELETE FROM tags WHERE id = #{id}"
    SqlRunner.run(sql)
  end 

end  