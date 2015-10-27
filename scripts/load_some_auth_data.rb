
  require 'rubygems'
  require 'yaml'
  require 'authorizenet'
  require 'credit_card_validations'




def do_some_auth()

  include AuthorizeNet::API

  config = YAML.load_file(File.dirname(__FILE__) + "/credentials.yml")

  transaction = Transaction.new(config['api_login_id'], config['api_transaction_key'], :gateway => :sandbox)

  amount = ((rand(10000) + 1).to_f/100) # random amount
  cardnumber = CreditCardValidations::Factory.random([:visa, :mastercard].sample) #random card number for amex/visa/mc

  request = CreateTransactionRequest.new
  request.transactionRequest = TransactionRequestType.new()
  request.transactionRequest.amount = amount
  request.transactionRequest.payment = PaymentType.new
  request.transactionRequest.payment.creditCard = CreditCardType.new(cardnumber,'0220','123') 
  request.transactionRequest.transactionType = TransactionTypeEnum::AuthOnlyTransaction
  
  response = transaction.create_transaction(request)

  if response.messages.resultCode == MessageTypeEnum::Ok
    puts "Successful AuthOnly Transaction (authorization code: #{response.transactionResponse.authCode})"
  else
    puts response.messages.messages[0].text
    puts response.transactionResponse.errors.errors[0].errorCode
    puts response.transactionResponse.errors.errors[0].errorText
    raise "Failed to authorize card."
  end

end



50.times do 
   do_some_auth
   sleep(1.second)
end


