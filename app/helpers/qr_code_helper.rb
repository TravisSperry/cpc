# frozen_string_literal: true

module QRCodeHelper
  def generate_qr(text)
    barcode = RQRCode::QRCode.new(text, level: :q, size: 5)
    qr_code = barcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color: 'black',
      file: nil,
      fill: 'white',
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 200
    )
    ['data:image/png;base64,', qr_code.to_blob].pack('A*m').gsub(/\n/, '')
  end
end

