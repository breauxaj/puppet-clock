Puppet::Type.newtype(:timezone) do
  @doc = "Configure timezone."

  ensurable
 
  newparam(:zone) do
    desc "Timezone"

    validate do |value|
      unless value =~ /^[a-z0-9_+-]+(\/[a-z0-9_+-]+)?(\/[a-z0-9_+-]+)?$/i
        raise ArgumentError , "%s is not a valid timezone" % value
      end
    end

    isnamevar

  end

  newparam(:utc) do
    desc "Host set to UTC?"

    newvalues(:true, :false)

  end

  newparam(:arc) do
    desc "Host set to ARC?"

    newvalues(:true, :false)

  end

end