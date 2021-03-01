class FillFormsController < ActionController::API
  def fill
    hypdf_request_params = { user: ENV['HYPDF_USER'], password: ENV['HYPDF_PASSWORD'] }.merge(params)

    hypdf_response = HyPDF.fillform(
      'test/fixtures/files/dental_admission.pdf',
      hypdf_request_params
    )

    send_data hypdf_response[:pdf], filename: 'dental_admission_filled.pdf', type: 'application/pdf'
  end
end
