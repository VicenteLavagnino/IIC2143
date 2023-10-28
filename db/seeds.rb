# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Creando dos usuarios
Message.delete_all
Chat.delete_all
User.delete_all

bob = User.create!(
  email: "bob@example.com",
  password: "password123",
  description: "Bob the Builder",
  image: "bob_path.jpg",
  number: 2678901,
  name: "Bob"
)

alice = User.create!(
  email: "alice@example.com",
  password: "password123",
  description: "Alice from Wonderland",
  image: "alice_path.jpg",
  number: 4567890,
  name: "Alice"
)

# Creando un chat entre Alice y Bob

# Creando un segundo chat entre Alice y Bob (esto es solo para el ejemplo, en la realidad no tendría mucho sentido tener múltiples chats directos entre dos usuarios)
charlie = User.create!(
  email: "charlie@example.com",
  password: "password123",
  description: "Charlie from Chocolate Factory",
  image: "charlie_path.jpg",
  number: 1234567,
  name: "Charlie"
)

# Creando chats entre los usuarios
chat_bob_alice = Chat.create!(user1: bob, user2: alice)
chat_bob_charlie = Chat.create!(user1: bob, user2: charlie)
chat_alice_charlie = Chat.create!(user1: alice, user2: charlie)

# Función auxiliar para agregar 8 mensajes a un chat
def create_messages_for_chat(chat, user1, user2)
  4.times do |i|
    Message.create!(
      chat: chat,
      user: i.even? ? user1 : user2,
      content: "#{user1.name} to #{user2.name} message #{i + 1}"
    )
  end
end

# Añadiendo mensajes a los chats
create_messages_for_chat(chat_bob_alice, bob, alice)
create_messages_for_chat(chat_bob_charlie, bob, charlie)
create_messages_for_chat(chat_alice_charlie, alice, charlie)