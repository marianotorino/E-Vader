require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @client_sin_contacto = clients(:sin_contacto)
    @client_con_contacto = clients(:con_contacto)
    @client_invalido = clients(:invalido)
  end

  test "Creacion de un cliente" do
    assert @client_sin_contacto.save
    assert @client_con_contacto.save
    assert_not @client_invalido.save
  end
  
  test "Borrado de clientes" do
    @client_sin_contacto.save
    @client_con_contacto.save
    bills(:valida).save
    assert_difference('Client.count',-1) do
      @client_sin_contacto.destroy
    end
    assert_difference('Client.count',-1) do
      @client_con_contacto.destroy
    end
  end
  
end
