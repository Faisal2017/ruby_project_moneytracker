require_relative('../db/sql_runner.rb')

class Merchant

  attr_reader :id, :merchant_name

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @merchant_name = options['merchant_name']
  end 

  def save()
    sql = "INSERT INTO merchants (merchant_name) VALUES ('#{@merchant_name}') RETURNING *"
    results = SqlRunner.run(sql)
    id = results.first["id"]
    @id = id.to_i()
  end

  def Merchant.find(id)
    sql = "SELECT FROM merchants WHERE id = #{id}"
    results = SqlRunner.run(sql).first()
    return Merchant.new (results)
  end

  def Merchant.all()
    sql = "SELECT * FROM merchants"
    result_hashes = SqlRunner.run(sql)
    return result_hashes.map { |result_hash| Merchant.new (result_hash) }
  end

  def Merchant.delete_all()
    sql = "DELETE from merchants"
    SqlRunner.run(sql)
  end

end