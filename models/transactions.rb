require_relative('..db/sql_runner.rb')

class Transaction

  attr_reader :id
  attr_accessor :date, :amount, :merchant_id, :tag_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @date = options['date']
    @amount = options['amount'].to_i()
    @merchant_id = options['merchant_id'].to_i()
    @tag_id = options['tag_id'].to_i()
  end

  def save
    sql = "INSERT INTO transactions (date, amount, merchant_id, tag_id) VALUES ('#{date}', #{amount}, #{merchant_id}, #{tag_id} RETURNING *)"
    result = Sql_runner.run(sql)
    id = result.first['id']
    @id = id 
  end

  def update
    sql = "UPDATE transactions SET date = '#{@date}', amount = #{@amount}, merchant_id = #{@merchant_id}, tag_id=#{@tag_id} WHERE id = #{@id}"
    Sql_runner.run(sql)
  end

end  