require_relative('../models/merchant.rb')
require_relative('../models/tags.rb')
require_relative('../models/transactions.rb')
require('pry-byebug')

Transaction.delete_all
Merchant.delete_all
Tag.delete_all

tag1 = Tag.new({
  'tag_name' => 'Education'
  })

tag1.save

tag2 = Tag.new({
  'tag_name' => 'Groceries'
  })

tag2.save

tag3 = Tag.new({
  'tag_name' => 'Bills'
  })

tag3.save

merchant1 = ({
  'merchant_name' => 'CodeClan'
  })

merchant1.save

merchant2 = ({
  'merchant_name' => 'Edinburgh Council'
  })

merchant2.save

merchant3 = ({
  'merchant_name' => 'Morrisons'
  })

merchant3.save

transaction1 = ({
  'date' => 'May',
  'amount' => 2500,
  merchant_id => merchant1.id,
  tag_id => tag1.id
  })

transaction2 = ({
  'date' => 'June',
  'amount' => 50,
  merchant_id => merchant3.id,
  tag_id => tag2.id
  })

transaction3 = ({
  'date' => 'June',
  amount => 100,
  merchant_id => merchant2.id,
  tag_id => tag3.id
  })

