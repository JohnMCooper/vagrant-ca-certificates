module VagrantPlugins
  module CaCertificates
    module Cap
      module Windows
        # Capability for configuring the certificate bundle on CoreOS.
        module UpdateCertificateBundle
          def self.update_certificate_bundle(m)
            # Import the certificates into the local machine root store
            m.communicate.sudo("Get-ChildItem -Path C:/ssl/certs | Import-Certificate -CertStoreLocation Cert:/LocalMachine/root")
            # Also import the certificates into a bundle to be referenced by SSL_CERT_FILE
            m.communicate.sudo("Remove-Item -Path C:/ssl/certs/ca-certificates.crt; Get-ChildItem -Path C:/ssl/certs | Get-Content | Out-File -FilePath C:/ssl/certs/ca-certificates.crt -Append")
          end
        end
      end
    end
  end
end
