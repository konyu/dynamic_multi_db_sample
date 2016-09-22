class OtherDb::User < User
  establish_connection :other_development
end
