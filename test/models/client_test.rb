require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  
  test "Creacion de un cliente vacio" do
    assert_not Client.new.save
  end

  test "Creacion de un cliente incompleto" do
    assert_not Client.new(name: "Pepe").save
    assert_not Client.new(surname: "Gomez").save
    assert_not Client.new(birthdate: "1994-05-25").save
    assert_not Client.new(dni: 31234567).save
    assert_not Client.new(cuit: "20-31234567-9").save
    assert_not Client.new(gender: "M").save
  end

  test "Creacion de un cliente sin contacto" do
    assert clients(:sin_contacto).save
  end    

  test "Creacion de un contacto con contacto" do
    contacts(:one).save
    assert clients(:con_contacto).save
  end

  test "Creacion de un contacto con datos invalidos" do
    assert_not clients(:invalido).save
  end
  
  test "Borrado de cliente sin facturas" do
    clients(:sin_contacto).save
    assert_difference('Client.count',-1) do
      clients(:sin_contacto).destroy
    end
  end

  test "Borrado de cliente con facturas" do
    clients(:con_contacto).save
    bills(:valida).save
    assert_difference('Client.count',-1) do
      clients(:con_contacto).destroy
    end
  end

end
