require 'test_helper'

class BillTest < ActiveSupport::TestCase

  test "Creacion de una factura vacia" do
    assert_not Bill.new.save
  end

  test "Creacion de una factura incompleta" do
    assert_not Bill.new(amount: 5000).save
    assert_not Bill.new(description: "Una descripcion").save
    assert_not Bill.new(date: "2013-11-15").save
  end

  test "Creacion de facturas con datos validos" do
    assert bills(:valida).save
  end

  test "Creacion de facturas con datos invalidos" do
    assert_not bills(:invalida).save
  end
end
