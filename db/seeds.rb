
User.destroy_all
Project.destroy_all
Type.destroy_all
Part.destroy_all



def hipster_sentences(sentences)
  require 'net/http'
  require 'uri'

  uri = URI.parse("https://hipsum.co/api/?type=hipster-centric&sentences=#{sentences}")
  response = Net::HTTP.get_response(uri)

  response.body.tr("\"[\\","").tr("]","")
  
end

def hipster_paras(paras)
  require 'net/http'
  require 'uri'

  uri = URI.parse("https://hipsum.co/api/?type=hipster-centric&paras=#{paras}")
  response = Net::HTTP.get_response(uri)

  response.body.tr("\"[\\","").tr("]","")
  
end


types = ['Woodworking', 'Metalworking', 'Electronics', '3D Printing', 'Crafts']
types.each do |type|
  Type.create(name: "#{type}", description: "#{hipster_sentences(3)}")
end

u1 = User.create(name: "mike", email: "email.com", password: "password")
u2 = User.create(name: "maddy", email: "email.com", password: "password")
u3 = User.create(name: "joel", email: "email.com", password: "password")
u4 = User.create(name: "cameron", email: "email.com", password: "password")
u5 = User.create(name: "evan", email: "email.com", password: "password")


part = Part.create(name: "Arduino", description: "The brains of the project", link: "https://store.arduino.cc/usa/arduino-uno-rev3")
part2 = Part.create(name: "Metal", description: "Hot rolled steel", link: "https://www.metalsupermarkets.com/metals/hot-rolled-steel/hot-rolled-steel-a36-square-bar/")


20.times do 
  project = Project.create(name: "Desk", brief_description: hipster_sentences(2), main_description: hipster_paras(3), public: true, user_id: User.all.sample.id, type_id: Type.all.sample.id)
  project.parts << part
  p = ProjectPart.last
  p.quantity = rand(1..5)
  p.save

  project.parts << part2
  p = ProjectPart.last
  p.quantity = rand(1..5)
  p.save


  x = 1
  3.times do 
    project.images.attach(io: File.open("app/assets/images/#{rand(1..5).to_s}/#{x.to_s}.jpeg"), filename: "#{x.to_s}.jpeg")
    x += 1
  end
  
end



