Puppet::Type.newtype(:timezone) do
  @doc = "Configure timezone."

  ensurable

  def munge_boolean(value)
    case value
    when true, "true", :true
      :true
    when false, "false", :false
      :false
    else
      fail("munge_boolean only takes booleans")
    end
  end

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

    newvalue(:true)
    newvalue(:false)

    munge do |value|
      @resource.munge_boolean(value)
    end

  end

  newparam(:arc) do
    desc "Host set to ARC?"

    newvalue(:true)
    newvalue(:false)

    munge do |value|
      @resource.munge_boolean(value)
    end

  end

end