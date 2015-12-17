require 'test_helper'

class BillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @factura_invalida = bills(:invalida)
    @factura_valida = bills(:valida)
  end

  test "Creacion de facturas para un cliente" do
    assert_not @factura_invalida.save
    assert @factura_valida.save
  end
end
