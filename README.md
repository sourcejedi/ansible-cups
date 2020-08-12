# sourcejedi.cups #

Install the CUPS printer service, and apply my preferred defaults.


## Status

This role applies a default configuration that I personally prefer, as described below.
It should work on Debian, Ubuntu, and Fedora.

This does not specifically enable
[Driverless Printing](https://wiki.debian.org/CUPSDriverlessPrinting).
If your installation requires specific steps in order to enable driverless printing,
the role will not perform those steps.

## Configuration

### cups-browsed service may be started

In the default setting, this role allows the distribution to enable
cups-browsed.  Or not.  Different Linux distributions have made
different choices here.

    cups_disable_browsed:

If you want to ensure cups-browsed is disabled, set:

    cups_disable_browsed: yes

If you want to ensure cups-browsed is enabled, set:

    cups_disable_browsed: no


### cups-browsed protocols

In the default setting, this role sets BrowseRemoteProtocols
to allow discovering network printers using `dnssd` only.
This disables the legacy `CUPS` protocol (listening on UDP
port 631).

    cups_browsed_remote_protocols: "dnssd"
    
You could disable `dnssd` if you want:

    cups_browsed_remote_protocols: "none"


### cupsd ErrorPolicy

Ubuntu and Debian set the default `ErrorPolicy` to `retry-job`.
Fedora (and upstream CUPS) default to `stop-printer`, which
requires administrative action before the printer can be used again.
This role follows Ubuntu.

    cups_error_policy: "retry-job"

There are other possible values, including `abort-job`.
I don't know the exact behaviour of each possible option.

    
## License

This role is licensed under GPLv3.
Please open an issue if this creates any problem.
