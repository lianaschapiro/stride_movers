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
      				Name: #{params[:name]}<br>
      				Email: #{params[:mail]}<br>
      				Phone: #{params[:phone]}<br>
      				Secondary Phone: #{params[:phone2]}<br>
      				How did you hear about us: #{params[:refer]}<br>
      				Date 1: #{params[:date1]}<br>
      				Date 2: #{params[:date2]}<br>
      				Date 3: #{params[:date3]}<br>
      				Date details: #{params[:datedetails]}<br>
      				Starting address: #{params[:starting]}<br>
      				Stairs @ start: #{params[:stairs_start]}<br>
      				Details @ start: #{params[:stairdetails_start]}
      				COI needed? #{params[:certificate]}
      				Ending address: #{params[:ending]}
      				Stairs @ end: #{params[:stairs_end]}
					Details @ end: #{params[:stairdetails_end]}    				
      				Deadlines: #{params[:deadlines]}
      				Furniture list: #{params[:furniture]}
      				Valuables: #{params[:valuable]}
      				Assembly? #{params[:assemble]}
      				Small boxes: #{params[:smallbox]}
      				Medium boxes: #{params[:mediumbox]}
      				Large boxes: #{params[:largebox]}
      				Wardrobe boxes: #{params[:wardrobebox]}
      				Other items: #{params[:other_items]}
      				Other info: #{params[:other]}
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