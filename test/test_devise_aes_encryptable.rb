require 'helper'

class TestDeviseAesEncryptable < Test::Unit::TestCase
  should "be accessible" do
    encryptor = :aes256
    assert ::Devise::Encryptable::Encryptors.const_get(encryptor.to_s.classify)
  end
  should "encrypt and decrypt a password" do
    plain_text  = "A super secret password"
    pepper      = "eaa15a1fb0b0707ba443f7ce52a5a0e345391ff83b9955342d2a8e1c755fcd868ba4fb3c156166e13c9d4080cf2b505b4a383adc553c9567d75e3585cbccff98"
    salt        = Devise::Encryptable::Encryptors::Aes256.salt(10)
    cipher_text = Devise::Encryptable::Encryptors::Aes256.digest(plain_text, 10, salt, pepper)
    assert_equal plain_text, Devise::Encryptable::Encryptors::Aes256.decrypt(cipher_text, pepper)
  end
end
