class FillFormsController < ActionController::API
  def fill
    hypdf_request_params = { user: ENV['HYPDF_USER'], password: ENV['HYPDF_PASSWORD'] }.merge(fill_params)

    hypdf_response = HyPDF.fillform(
      'test/fixtures/files/dental_admission.pdf',
      hypdf_request_params
    )

    send_data hypdf_response[:pdf], filename: 'dental_admission_filled.pdf', type: 'application/pdf'
  end

  private

  def fill_params
    params.permit(*%i[patient_name patient_sex patient_species patient_breed patient_age patient_birthday patient_weight patient_rabies_tag patient_microchip patient_alerts family_name human_name family_email family_phone family_address family_partner])
  end
end
