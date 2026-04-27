module("luci.controller.tailscale", package.seeall)

function index()
    if not nixio.fs.access("/usr/bin/tailscale") then
        return
    end

    entry({"admin", "services", "tailscale"}, template("tailscale"), _("Tailscale"), 90)
end
