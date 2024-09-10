puts "Bem-vindo!"
def menu
  require_relative 'login'
  login = Login.new
  login.autenticacao

end

menu