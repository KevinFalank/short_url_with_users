User.create(name:"Tara", password:"password", email: "tara@gmail.com")
User.create(name:"Kevin", password:"abc123", email: "kevin@gmail.com")
User.create(name:"Wilma", password:"123456789", email: "wilma@gmail.com")

Url.create(long_url:"http://www.google.com",short_url:"1")
Url.create(long_url:"http://tararoys.com",short_url:"2", user_id: "1")
