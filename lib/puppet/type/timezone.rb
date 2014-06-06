Puppet::Type.newtype(:timezone) do
  @doc = "Configure timezone."

  ensurable
 
  newparam(:zone) do
    desc "Timezone"

    validate do |value|
      unless value =~ /^[a-z0-9_]+\/[a-z0-9_]+(\/[a-z0-9_]+)?$/i
        raise ArgumentError , "%s is not a valid timezone" % value
      end
    end

    isnamevar

  end

  newparam(:utc) do
    desc "Host set to UTC?"

    validate do |value|

    end

  end

  newparam(:arc) do
    desc "Host set to ARC?"

    validate do |value|

    end

  end

end