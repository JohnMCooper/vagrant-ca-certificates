module VagrantPlugins
  module CaCertificates
    module Cap
      module Suse
        module CertificateUploadPath
          def self.certificate_upload_path(m)
            '/usr/share/pki/trust/anchors'
          end
        end
      end
    end
  end
end
