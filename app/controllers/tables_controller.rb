class TablesController < ApplicationController
  before_action :set_table, only: [:show, :edit, :update, :destroy]

  # GET /tables
  # GET /tables.json
  def index
    @tables = Table.all
  end

  # GET /tables/1
  # GET /tables/1.json
  def show
    @countries = [["OC Oceania","oc"],["AD Andorra", "ad"],["AE United Arab Emirates", "ae"],["AF Afghanistan", "af"],["AG Antigua and Barbuda", "ag"],["AI Anguilla", "ai"],["AL Albania", "al"],["AM Armenia", "am"],["AO Angola", "ao"],["AQ Antarctica", "aq"],["AR Argentina", "ar"],["AS American Samoa", "as"],["AT Austria", "at"],["AU Australia", "au"],["AW Aruba", "aw"],["AX Åland Islands", "ax"],["AZ Azerbaijan", "az"],["BA Bosnia and Herzegovina", "ba"],["BB Barbados", "bb"],["BD Bangladesh", "bd"],["BE Belgium", "be"],["BF Burkina Faso", "bf"],["BG Bulgaria", "bg"],["BH Bahrain", "bh"],["BI Burundi", "bi"],["BJ Benin", "bj"],["BL Saint Barthélemy", "bl"],["BM Bermuda", "bm"],["BN Brunei Darussalam", "bn"],["BO Bolivia, Plurinational State of", "bo"],["BQ Bonaire, Sint Eustatius and Saba", "bq"],["BR Brazil", "br"],["BS Bahamas", "bs"],["BT Bhutan", "bt"],["BV Bouvet Island", "bv"],["BW Botswana", "bw"],["BY Belarus", "by"],["BZ Belize", "bz"],["CA Canada", "ca"],["CC Cocos (Keeling) Islands", "cc"],["CD Congo, the Democratic Republic of the", "cd"],["CF Central African Republic", "cf"],["CG Congo", "cg"],["CH Switzerland", "ch"],["CI Côte d'Ivoire", "ci"],["CK Cook Islands", "ck"],["CL Chile", "cl"],["CM Cameroon", "cm"],["CN China", "cn"],["CO Colombia", "co"],["CR Costa Rica", "cr"],["CU Cuba", "cu"],["CV Cape Verde", "cv"],["CW Curaçao", "cw"],["CX Christmas Island", "cx"],["CY Cyprus", "cy"],["CZ Czech Republic", "cz"],["DE Germany", "de"],["DJ Djibouti", "dj"],["DK Denmark", "dk"],["DM Dominica", "dm"],["DO Dominican Republic", "do"],["DZ Algeria", "dz"],["EC Ecuador", "ec"],["EE Estonia", "ee"],["EG Egypt", "eg"],["EH Western Sahara", "eh"],["ER Eritrea", "er"],["ES Spain", "es"],["ET Ethiopia", "et"],["FI Finland", "fi"],["FJ Fiji", "fj"],["FK Falkland Islands (Malvinas)", "fk"],["FM Micronesia, Federated States of", "fm"],["FO Faroe Islands", "fo"],["FR France", "fr"],["GA Gabon", "ga"],["GB United Kingdom", "gb"],["GD Grenada", "gd"],["GE Georgia", "ge"],["GF French Guiana", "gf"],["GG Guernsey", "gg"],["GH Ghana", "gh"],["GI Gibraltar", "gi"],["GL Greenland", "gl"],["GM Gambia", "gm"],["GN Guinea", "gn"],["GP Guadeloupe", "gp"],["GQ Equatorial Guinea", "gq"],["GR Greece", "gr"],["GS South Georgia and the South Sandwich Islands", "gs"],["GT Guatemala", "gt"],["GU Guam", "gu"],["GW Guinea-Bissau", "gw"],["GY Guyana", "gy"],["HK Hong Kong", "hk"],["HM Heard Island and McDonald Islands", "hm"],["HN Honduras", "hn"],["HR Croatia", "hr"],["HT Haiti", "ht"],["HU Hungary", "hu"],["ID Indonesia", "id"],["IE Ireland", "ie"],["IL Israel", "il"],["IM Isle of Man", "im"],["IN India", "in"],["IO British Indian Ocean Territory", "io"],["IQ Iraq", "iq"],["IR Iran, Islamic Republic of", "ir"],["IS Iceland", "is"],["IT Italy", "it"],["JE Jersey", "je"],["JM Jamaica", "jm"],["JO Jordan", "jo"],["JP Japan", "jp"],["KE Kenya", "ke"],["KG Kyrgyzstan", "kg"],["KH Cambodia", "kh"],["KI Kiribati", "ki"],["KM Comoros", "km"],["KN Saint Kitts and Nevis", "kn"],["KP Korea, Democratic People's Republic of", "kp"],["KR Korea, Republic of", "kr"],["KW Kuwait", "kw"],["KY Cayman Islands", "ky"],["KZ Kazakhstan", "kz"],["LA Lao People's Democratic Republic", "la"],["LB Lebanon", "lb"],["LC Saint Lucia", "lc"],["LI Liechtenstein", "li"],["LK Sri Lanka", "lk"],["LR Liberia", "lr"],["LS Lesotho", "ls"],["LT Lithuania", "lt"],["LU Luxembourg", "lu"],["LV Latvia", "lv"],["LY Libya", "ly"],["MA Morocco", "ma"],["MC Monaco", "mc"],["MD Moldova, Republic of", "md"],["ME Montenegro", "me"],["MF Saint Martin (French part)", "mf"],["MG Madagascar", "mg"],["MH Marshall Islands", "mh"],["MK Macedonia, the former Yugoslav Republic of", "mk"],["ML Mali", "ml"],["MM Myanmar", "mm"],["MN Mongolia", "mn"],["MO Macao", "mo"],["MP Northern Mariana Islands", "mp"],["MQ Martinique", "mq"],["MR Mauritania", "mr"],["MS Montserrat", "ms"],["MT Malta", "mt"],["MU Mauritius", "mu"],["MV Maldives", "mv"],["MW Malawi", "mw"],["MX Mexico", "mx"],["MY Malaysia", "my"],["MZ Mozambique", "mz"],["NA Namibia", "na"],["NC New Caledonia", "nc"],["NE Niger", "ne"],["NF Norfolk Island", "nf"],["NG Nigeria", "ng"],["NI Nicaragua", "ni"],["NL Netherlands", "nl"],["NO Norway", "no"],["NP Nepal", "np"],["NR Nauru", "nr"],["NU Niue", "nu"],["NZ New Zealand", "nz"],["OM Oman", "om"],["PA Panama", "pa"],["PE Peru", "pe"],["PF French Polynesia", "pf"],["PG Papua New Guinea", "pg"],["PH Philippines", "ph"],["PK Pakistan", "pk"],["PL Poland", "pl"],["PM Saint Pierre and Miquelon", "pm"],["PN Pitcairn", "pn"],["PR Puerto Rico", "pr"],["PS Palestine, State of", "ps"],["PT Portugal", "pt"],["PW Palau", "pw"],["PY Paraguay", "py"],["QA Qatar", "qa"],["RE Réunion", "re"],["RO Romania", "ro"],["RS Serbia", "rs"],["RU Russian Federation", "ru"],["RW Rwanda", "rw"],["SA Saudi Arabia", "sa"],["SB Solomon Islands", "sb"],["SC Seychelles", "sc"],["SD Sudan", "sd"],["SE Sweden", "se"],["SG Singapore", "sg"],["SH Saint Helena, Ascension and Tristan da Cunha", "sh"],["SI Slovenia", "si"],["SJ Svalbard and Jan Mayen", "sj"],["SK Slovakia", "sk"],["SL Sierra Leone", "sl"],["SM San Marino", "sm"],["SN Senegal", "sn"],["SO Somalia", "so"],["SR Suriname", "sr"],["SS South Sudan", "ss"],["ST Sao Tome and Principe", "st"],["SV El Salvador", "sv"],["SX Sint Maarten (Dutch part)", "sx"],["SY Syrian Arab Republic", "sy"],["SZ Swaziland", "sz"],["TC Turks and Caicos Islands", "tc"],["TD Chad", "td"],["TF French Southern Territories", "tf"],["TG Togo", "tg"],["TH Thailand", "th"],["TJ Tajikistan", "tj"],["TK Tokelau", "tk"],["TL Timor-Leste", "tl"],["TM Turkmenistan", "tm"],["TN Tunisia", "tn"],["TO Tonga", "to"],["TR Turkey", "tr"],["TT Trinidad and Tobago", "tt"],["TV Tuvalu", "tv"],["TW Taiwan, Province of China", "tw"],["TZ Tanzania, United Republic of", "tz"],["UA Ukraine", "ua"],["UG Uganda", "ug"],["UM United States Minor Outlying Islands", "um"],["US United States", "us"],["UY Uruguay", "uy"],["UZ Uzbekistan", "uz"],["VA Holy See (Vatican City State)", "va"],["VC Saint Vincent and the Grenadines", "vc"],["VE Venezuela, Bolivarian Republic of", "ve"],["VG Virgin Islands, British", "vg"],["VI Virgin Islands, U.S.", "vi"],["VN Viet Nam", "vn"],["VU Vanuatu", "vu"],["WF Wallis and Futuna", "wf"],["WS Samoa", "ws"],["YE Yemen", "ye"],["YT Mayotte", "yt"],["ZA South Africa", "za"],["ZM Zambia", "zm"],["ZW Zimbabwe", "zw"]]
    @fullscreen = true
    @match = nil
    # current match
    if @table.matches.where(is_running: true).size > 0
      @match = @table.matches.where(is_running: true).first
    end
    # previous match
    if @table.matches.where(is_running: true).size == 0 && @table.matches.where(is_over: true).size > 0
      @match = @table.matches.where(is_over: true).reorder("matches.finished_at DESC").first
    end
  end

  # GET /tables/new
  def new
    @table = Table.new
  end

  # GET /tables/1/edit
  def edit
  end

  # POST /tables
  # POST /tables.json
  def create
    @table = Table.new(table_params)

    respond_to do |format|
      if @table.save
        format.html { redirect_to tables_path, notice: 'Table was successfully created.' }
        format.json { render action: 'show', status: :created, location: @table }
      else
        format.html { render action: 'new' }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tables/1
  # PATCH/PUT /tables/1.json
  def update
    respond_to do |format|
      if @table.update(table_params)
        format.html { redirect_to tables_path, notice: 'Table was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @table }
      else
        format.html { render action: 'edit' }
        format.json { render json: @table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tables/1
  # DELETE /tables/1.json
  def destroy
    @table.destroy
    respond_to do |format|
      format.html { redirect_to tables_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_table
      @table = Table.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def table_params
      params.require(:table).permit(:name, :reverse_ends)
    end
end
