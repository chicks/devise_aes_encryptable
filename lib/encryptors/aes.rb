require 'aes'

module Devise
  module Encryptors
    # = AES
    # Uses the AES algorithm to encrypt passwords.
    class AES
      # Returns a Base64 encrypted password where pepper is used for the key,
      # and the initialization_vector is randomly generated and prepended onto
      # encoded ciphertext
      def self.digest(password, stretches, salt, pepper)
        digest = ::AES.encrypt(pepper, password)
      end
      class << self
        alias :encrypt :digest
      end
      
      # Returns the plaintext password where pepper is used for the key,
      # and the initialization_vector is read from the Base64 encoded ciphertext
      def self.decrypt(encrypted_password, pepper)
        password = ::AES.decrypt(pepper, encrypted_password)
      end
    end
  end
end