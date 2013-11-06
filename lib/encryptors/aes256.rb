require 'aes'

module Devise
  module Encryptable
    module Encryptors
      # = AES
      # Uses the AES algorithm to encrypt passwords.
      class Aes256 < Base
        class << self
          # Returns a Base64 encrypted password where pepper is used for the key,
          # and the initialization_vector is randomly generated and prepended onto
          # encoded ciphertext
          def digest(password, stretches, salt, pepper)
            begin
              ::AES.encrypt(password, pepper, {:iv => salt}) if password
            rescue
              nil
            end
          end
          alias :encrypt :digest
          # Returns a base64 encoded salt
          def salt(stretches=0)
            ::AES.iv(:base_64)
          end
          # Returns the plaintext password where pepper is used for the key,
          # and the initialization_vector is read from the Base64 encoded ciphertext
          def decrypt(encrypted_password, pepper)        
            ::AES.decrypt(encrypted_password, pepper)
          end
        end
      end
    end
  end
end