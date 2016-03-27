require 'sinatra'
require 'sendgrid-ruby'
# require 'sinatra/flash'
# require 'valid_email'
# require 'valid_email/validate_email'
# set :port, 9494
# enable :sessions

get '/' do 
  erb :home
end

post '/email' do 
  # if ValidateEmail.valid?(params[:mail])
    client = SendGrid::Client.new(api_key: ENV['SENDGRID_API_KEY'])
    email = SendGrid::Mail.new do |m|
      m.to      = 'liana.schapiro@gmail.com'
      m.from    = params[:mail]
      m.subject = 'Email Sent From Stride Movers'
      m.html    = "<style='font-size:16px'>
      				Name: #{params[:name]}
      				Email: #{params[:mail]}
      				Phone: #{params[:phone]}
      				Secondary Phone: #{params[:phone2]}
      				How did you hear about us: #{params[:refer]}
      				Date 1: #{params[:date1]}
      				Date 2: #{params[:date2]}
      				Date 3: #{params[:date3]}\r\n\r\n
      				Date details: #{params[:datedetails]}\r\n\r\n
      				Starting address: #{params[:starting]}\r\n\r\n
      				Stairs @ start: #{params[:stairs_start]}\r\n\r\n
      				Details @ start: #{params[:stairdetails_start]}\r\n\r\n
      				COI needed? #{params[:certificate]}\r\n\r\n
      				Ending address: #{params[:ending]}\r\n\r\n
      				Stairs @ end: #{params[:stairs_end]}\r\n\r\n
					Details @ end: #{params[:stairdetails_end]}\r\n\r\n     				
      				Deadlines: #{params[:deadlines]}\r\n\r\n
      				Furniture list: #{params[:furniture]}\r\n\r\n
      				Valuables: #{params[:valuable]}\r\n\r\n
      				Assembly? #{params[:assemble]}\r\n\r\n
      				Small boxes: #{params[:smallbox]}\r\n\r\n
      				Medium boxes: #{params[:mediumbox]}\r\n\r\n
      				Large boxes: #{params[:largebox]}\r\n\r\n
      				Wardrobe boxes: #{params[:wardrobebox]}\r\n\r\n
      				Other items: #{params[:other_items]}\r\n\r\n
      				Other info: #{params[:other]}\r\n\r\n
      				</style>"
    end
  if client.send(email)
    # flash[:notice]="You've messaged me, I'll get back to you asap!"
    redirect '/'
  else
    # flash[:notice]="Please use a properly formatted email address!"
    redirect '/#quote'
  end
end

get '/resume' do 
  erb :resume
end