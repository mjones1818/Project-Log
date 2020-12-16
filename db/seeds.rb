# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Project.destroy_all
Type.destroy_all
Part.destroy_all
Tool.destroy_all

main_description = <<-HERE
I'm baby mixtape post-ironic YOLO, brooklyn cold-pressed listicle gentrify affogato scenester brunch beard. Succulents chillwave taiyaki blue bottle PBR&B bitters tattooed organic 90's distillery cornhole vinyl. Cronut stumptown wayfarers, ennui actually direct trade lomo. Lo-fi banh mi lyft, keytar drinking vinegar wayfarers fixie meggings keffiyeh. Pinterest street art brunch occupy four dollar toast hella, banjo shoreditch selvage seitan narwhal quinoa master cleanse franzen vexillologist. Blog dreamcatcher godard vexillologist cold-pressed aesthetic chartreuse williamsburg kogi blue bottle kickstarter shoreditch gentrify. Vinyl single-origin coffee yr umami.
Cred brunch fam, freegan locavore umami yuccie pitchfork mlkshk coloring book meggings. Quinoa +1 austin, disrupt biodiesel pour-over waistcoat glossier deep v skateboard. Wayfarers humblebrag green juice art party. Cardigan helvetica cornhole four loko, vice live-edge affogato fanny pack. Blue bottle shaman letterpress pop-up occupy pinterest cold-pressed ugh.
Meggings leggings DIY, austin tacos polaroid authentic ennui woke mlkshk vape etsy distillery raclette twee. Etsy yuccie bushwick slow-carb. Selfies whatever lumbersexual tattooed williamsburg. Narwhal kickstarter health goth, ramps brunch portland prism marfa literally taxidermy. Squid readymade skateboard poutine sustainable fanny pack ugh bespoke sartorial. Bushwick live-edge pop-up kitsch, four loko salvia wayfarers. Scenester microdosing actually roof party kinfolk.
Wolf fixie fam yr food truck green juice crucifix locavore 
kitsch cornhole gastropub mixtape. Jianbing retro microdosing actually vice plaid beard blue bottle drinking vinegar. Unicorn post-ironic literally quinoa. Sartorial food truck distillery cronut 8-bit, schlitz bushwick butcher. Drinking vinegar portland sartorial, mumblecore whatever pinterest brunch lo-fi celiac. Banh mi fam banjo kinfolk locavore knausgaard bicycle rights quinoa shoreditch.
Shaman pickled asymmetrical copper mug, sriracha seitan mumblecore chicharrones authentic kitsch master cleanse coloring book slow-carb. Normcore enamel pin small batch, food truck trust fund hoodie woke selfies salvia lyft. Pug craft beer echo park cred vaporware, austin selfies. Franzen chillwave taiyaki lo-fi chambray, brooklyn mumblecore tattooed chartreuse tousled yr iceland migas lyft pabst. Butcher cardigan intelligentsia, hell of ugh vinyl knausgaard waistcoat celiac truffaut jianbing bitters. Normcore semiotics disrupt direct trade. Kitsch kombucha copper mug cliche plaid, pitchfork distillery mustache cronut skateboard deep v 8-bit mlkshk gluten-free.

HERE


t = Type.create(name: "Woodworking", description: "Wood projects")
u = User.create(name: "mike", email: "email.com", password: "password")

part = Part.create(name: "Arduino", description: "The brains of the project", link: "link")
part2 = Part.create(name: "test", description: "test test test", link: "link")
tool = Tool.create(name: "Welder", description: "Used to fuse metals together", link: "link")

3.times do 
  project = Project.create(name: "Desk", brief_description: "Wood slab sit/stand desk", main_description: main_description, public: true, user_id: u.id, type_id: t.id)
  project.parts << part
  p = ProjectPart.last
  p.quantity = 3
  p.save

  project.parts << part2
  p = ProjectPart.last
  p.quantity = 3
  p.save

  project.tools << tool
  x = 1
  3.times do 
    project.images.attach(io: File.open("app/assets/images/#{x.to_s}.jpeg"), filename: "#{x.to_s}.jpeg")
    x += 1
  end
  
end