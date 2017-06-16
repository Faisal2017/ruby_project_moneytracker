require_relative('../db/sql_runner.rb')

class Merchant

  attr_reader :id, :merchant_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_name = options['merchant_name']
  end 

  def save
    sql = "INSERT INTO merchants (merchant_name) VALUES ('#{@merchant_name}' RETURNING *"
    result = sql_runner.run(sql)
    id = results.first["id"]
    @id = id.to_i()
  end

end