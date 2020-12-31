
User.destroy_all
Project.destroy_all
Type.destroy_all
Part.destroy_all
ProjectPart.destroy_all

class Hipster
  @@requests = {}
  @@requests_paras = {}
  def self.request(sentences)
    require 'net/http'
    require 'uri'
    uri = URI.parse("https://hipsum.co/api/?type=hipster-centric&sentences=#{sentences}")
    response = Net::HTTP.get_response(uri)
    response.body.tr("\"[\\","").tr("]","")
  end
  
  def self.hipster_sentences(sentences)
    @@requests[sentences] ||= request(sentences)
    @@requests[sentences]
  end
  
  def self.request_paras(paras)
    require 'net/http'
    require 'uri'
    uri = URI.parse("https://hipsum.co/api/?type=hipster-centric&paras=#{paras}")
    response = Net::HTTP.get_response(uri)
    response.body.tr("\"[\\","").tr("]","")
  end
  
  
  def self.hipster_paras(paras)
    @@requests_paras[paras] ||= request_paras(paras)
    @@requests_paras[paras]
  end
end



types = ['Woodworking', 'Metalworking', 'Electronics', 'Crafts', 'Home']
types.each do |type|
  Type.create(name: "#{type}", description: "#{Hipster.hipster_sentences(3)}")
end

u1 = User.create(name: "mike", email: "email.com", password: "password")
u2 = User.create(name: "maddy", email: "maddyemail.com", password: "password")
u3 = User.create(name: "joel", email: "joelemail.com", password: "password")
u4 = User.create(name: "cameron", email: "cameronemail.com", password: "password")
u5 = User.create(name: "evan", email: "evanemail.com", password: "password")


part = Part.create(name: "Arduino", description: "The brains of the project", link: "https://store.arduino.cc/usa/arduino-uno-rev3")
part2 = Part.create(name: "Metal", description: "Hot rolled steel", link: "https://www.metalsupermarkets.com/metals/hot-rolled-steel/hot-rolled-steel-a36-square-bar/")


10.times do
  types = Dir.entries("app/assets/images")
  types = types.delete_if {|i| i.starts_with?(".")}
  types.each_with_index do |type, index|
    filenames = Dir.entries("app/assets/images/#{type}")
    filenames = filenames.delete_if {|i| i.starts_with?(".")}
    filenames.each do |file|
      project = Project.new(name: file, brief_description: Hipster.hipster_sentences(rand(1..3)), main_description: Hipster.hipster_paras(rand(2..6)), public: ([true, true].sample), user_id: User.all.sample.id, type_id: Type.find_by(name: type).id)
      image_count = Dir.entries("app/assets/images/#{type}/#{file}").delete_if {|i| i.starts_with?(".")}.count
      x = 1
      image_count.times do 
        project.images.attach(io: File.open("app/assets/images/#{type}/#{file}/#{x.to_s}.jpeg"), filename: "#{x.to_s}.jpeg")
        x += 1
      end
      
      project.parts << part
      project.save
      p = project.project_parts.last
      p.quantity = rand(1..5)
      p.save
      
      project.parts << part2
      project.save
      p = project.project_parts.last
      p.quantity = rand(1..5)
      p.save
      project.save
      
    end
  end
end



