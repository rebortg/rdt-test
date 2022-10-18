:lastproofread: 2021-07-13

.. _wwan-interface:

#################################
WWAN - Wireless Wide-Area-Network
#################################

The Wireless Wide-Area-Network interface provides access (through a wireless
modem/wwan) to wireless networks provided by various cellular providers.

VyOS uses the `interfaces wwan` subsystem for configuration.

*************
Configuration
*************

Common interface configuration
==============================

.. cmdinclude:: /_include/interface-address-with-dhcp.txt
   :var0: wwan
   :var1: wwan0


.. cmdinclude:: /_include/interface-description.txt
   :var0: wwan
   :var1: wwan0

.. cmdinclude:: /_include/interface-disable.txt
   :var0: wwan
   :var1: wwan0

.. cmdinclude:: /_include/interface-disable-link-detect.txt
   :var0: wwan
   :var1: wwan0

.. cmdinclude:: /_include/interface-mtu.txt
   :var0: wwan
   :var1: wwan0

.. cmdinclude:: /_include/interface-ip.txt
   :var0: wwan
   :var1: wwan0

.. cmdinclude:: /_include/interface-ipv6.txt
   :var0: wwan
   :var1: wwan0

.. cmdinclude:: /_include/interface-vrf.txt
   :var0: wwan
   :var1: wwan0

**DHCP(v6)**

.. cmdinclude:: /_include/interface-dhcp-options.txt
   :var0: wwan
   :var1: wwan0

.. cmdinclude:: /_include/interface-dhcpv6-options.txt
   :var0: wwan
   :var1: wwan0

.. cmdinclude:: /_include/interface-dhcpv6-prefix-delegation.txt
   :var0: wwan
   :var1: wwan0

WirelessModem (WWAN) options
============================

.. cfgcmd:: set interfaces wwan <interface> apn <apn>

  Every WWAN connection requires an :abbr:`APN (Access Point Name)` which is
  used by the client to dial into the ISPs network. This is a mandatory
  parameter. Contact your Service Provider for correct APN.


*********
Operation
*********

.. opcmd:: show interfaces wwan <interface>

  Show detailed information on given `<interface>`

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0
    wwan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UNKNOWN group default qlen 1000
        link/ether 02:c2:f3:00:01:02 brd ff:ff:ff:ff:ff:ff
        inet 10.155.144.12/30 brd 10.155.144.15 scope global dynamic wwan0
           valid_lft 7012sec preferred_lft 7012sec
        inet6 fe80::c2:f3ff:fe00:0102/64 scope link
           valid_lft forever preferred_lft forever

        RX:  bytes  packets  errors  dropped  overrun       mcast
               640        2       0        0        0           0
        TX:  bytes  packets  errors  dropped  carrier  collisions
              3229       16       0        0        0           0

.. opcmd:: show interfaces wwan <interface> summary

  Show detailed information summary on given `<interface>`

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 summary
      --------------------------------
      General  |            dbus path: /org/freedesktop/ModemManager1/Modem/0
               |            device id: 79f4e9cc2e9fc8d4a3b8c8f6327c2e363170194d
      --------------------------------
      Hardware |         manufacturer: Sierra Wireless, Incorporated
               |                model: MC7710
               |             revision: SWI9200X_03.05.29.03ap r6485 CNSHZ-ED-XP0031 2014/12/02 17:53:15
               |         h/w revision: 1.0
               |            supported: gsm-umts, lte
               |              current: gsm-umts, lte
               |         equipment id: 358xxxxxxxxxxxx
      --------------------------------
      System   |               device: /sys/devices/pci0000:00/0000:00:13.0/usb3/3-1/3-1.3
               |              drivers: qcserial, qmi_wwan
               |               plugin: Generic
               |         primary port: cdc-wdm0
               |                ports: ttyUSB0 (qcdm), ttyUSB2 (at), cdc-wdm0 (qmi), wwan0 (net)
      --------------------------------
      Numbers  |                  own: 4917xxxxxxxx
      --------------------------------
      Status   |                 lock: sim-pin2
               |       unlock retries: sim-pin (3), sim-pin2 (3), sim-puk (10), sim-puk2 (10)
               |                state: connected
               |          power state: on
               |          access tech: lte
               |       signal quality: 63% (recent)
      --------------------------------
      Modes    |            supported: allowed: 2g; preferred: none
               |                       allowed: 3g; preferred: none
               |                       allowed: 4g; preferred: none
               |                       allowed: 2g, 3g; preferred: 3g
               |                       allowed: 2g, 3g; preferred: 2g
               |                       allowed: 2g, 4g; preferred: 4g
               |                       allowed: 2g, 4g; preferred: 2g
               |                       allowed: 3g, 4g; preferred: 3g
               |                       allowed: 3g, 4g; preferred: 4g
               |                       allowed: 2g, 3g, 4g; preferred: 4g
               |                       allowed: 2g, 3g, 4g; preferred: 3g
               |                       allowed: 2g, 3g, 4g; preferred: 2g
               |              current: allowed: 2g, 3g, 4g; preferred: 2g
      --------------------------------
      Bands    |            supported: egsm, dcs, pcs, utran-1, utran-8, eutran-1, eutran-3,
               |                       eutran-7, eutran-8, eutran-20
               |              current: egsm, dcs, pcs, utran-1, utran-8, eutran-1, eutran-3,
               |                       eutran-7, eutran-8, eutran-20
      --------------------------------
      IP       |            supported: ipv4, ipv6, ipv4v6
      --------------------------------
      3GPP     |                 imei: 358xxxxxxxxxxxx
               |          operator id: 26201
               |        operator name: Telekom.de
               |         registration: home
      --------------------------------
      3GPP EPS | ue mode of operation: ps-1
      --------------------------------
      SIM      |            dbus path: /org/freedesktop/ModemManager1/SIM/0
      --------------------------------
      Bearer   |            dbus path: /org/freedesktop/ModemManager1/Bearer/0


.. opcmd:: show interfaces wwan <interface> capabilities

  Show WWAN module hardware capabilities.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 capabilities
    Max TX channel rate: '50000000'
    Max RX channel rate: '100000000'
    Data Service: 'simultaneous-cs-ps'
    SIM: 'supported'
    Networks: 'gsm, umts, lte'
    Bands: 'gsm-dcs-1800, gsm-900-extended, gsm-900-primary, gsm-pcs-1900, wcdma-2100, wcdma-900'
    LTE bands: '1, 3, 7, 8, 20'

.. opcmd:: show interfaces wwan <interface> firmware

  Show WWAN module firmware.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 firmware
    Model: MC7710
    Boot version: SWI9200X_03.05.29.03bt r6485 CNSHZ-ED-XP0031 2014/12/02 17:33:08
    AMSS version: SWI9200X_03.05.29.03ap r6485 CNSHZ-ED-XP0031 2014/12/02 17:53:15
    SKU ID: unknown
    Package ID: unknown
    Carrier ID: 0
    Config version: unknown


.. opcmd:: show interfaces wwan <interface> imei

  Show WWAN module IMEI.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 imei
    ESN: '0'
    IMEI: '358xxxxxxxxxxxx'
    MEID: 'unknown'

.. opcmd:: show interfaces wwan <interface> imsi

  Show WWAN module IMSI.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 imsi
    IMSI: '262xxxxxxxxxxxx'

.. opcmd:: show interfaces wwan <interface> model

  Show WWAN module model.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 model
    Model: 'MC7710'

.. opcmd:: show interfaces wwan <interface> msisdn

  Show WWAN module MSISDN.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 msisdn
    MSISDN: '4917xxxxxxxx'

.. opcmd:: show interfaces wwan <interface> revision

  Show WWAN module hardware revision.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 revision
    Revision: 'SWI9200X_03.05.29.03ap r6485 CNSHZ-ED-XP0031 2014/12/02 17:53:15'

.. opcmd:: show interfaces wwan <interface> signal

  Show WWAN module signal strength.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 signal
    LTE:
    RSSI: '-74 dBm'
    RSRQ: '-7 dB'
    RSRP: '-100 dBm'
    SNR: '13.0 dB'
    Radio Interface:   'lte'
    Active Band Class: 'eutran-3'
    Active Channel:    '1300'

.. opcmd:: show interfaces wwan <interface> sim

  Show WWAN module SIM card information.

  .. code-block:: none

    vyos@vyos:~$ show interfaces wwan wwan0 sim
    Provisioning applications:
    Primary GW:   slot '1', application '1'
    Primary 1X:   session doesn't exist
    Secondary GW: session doesn't exist
    Secondary 1X: session doesn't exist
    Slot [1]:
    Card state: 'present'
    UPIN state: 'not-initialized'
    UPIN retries: '0'
    UPUK retries: '0'
    Application [1]:
    Application type:  'usim (2)'
    Application state: 'ready'
    Application ID:
    A0:00:00:00:87:10:02:FF:49:94:20:89:03:10:00:00
    Personalization state: 'ready'
    UPIN replaces PIN1: 'no'
    PIN1 state: 'disabled'
    PIN1 retries: '3'
    PUK1 retries: '10'
    PIN2 state: 'enabled-not-verified'
    PIN2 retries: '3'
    PUK2 retries: '10'

*******
Example
*******

The following example is based on a Sierra Wireless MC7710 miniPCIe card (only
the form factor in reality it runs UBS) and Deutsche Telekom as ISP. The card
is assembled into a :ref:`pc-engines-apu4`.

.. code-block:: none

  set interfaces wwan wwan0 apn 'internet.telekom'
  set interfaces wwan wwan0 address 'dhcp'

*****************
Supported Modules
*****************

The following hardware modules have been tested successfully in an
:ref:`pc-engines-apu4` board:

* Sierra Wireless AirPrime MC7304 miniPCIe card (LTE)
* Sierra Wireless AirPrime MC7430 miniPCIe card (LTE)
* Sierra Wireless AirPrime MC7455 miniPCIe card (LTE)
* Sierra Wireless AirPrime MC7710 miniPCIe card (LTE)
* Huawei ME909u-521 miniPCIe card (LTE)
* Huawei ME909s-120 miniPCIe card (LTE)

***************
Firmware Update
***************

All available WWAN cards have a build in, reprogrammable firmware. Most of the
vendors provide a regular update to the firmware used in the baseband chip.

As VyOS makes use of the QMI interface to connect to the WWAN modem cards, also
the firmware can be reprogrammed.

To update the firmware, VyOS also ships the `qmi-firmware-update` binary. To
upgrade the firmware of an e.g. Sierra Wireless MC7710 module to the firmware
provided in the file ``9999999_9999999_9200_03.05.14.00_00_generic_000.000_001_SPKG_MC.cwe``
use the following command:

.. code-block:: bash

  $ sudo qmi-firmware-update --update -d 1199:68a2 \
     9999999_9999999_9200_03.05.14.00_00_generic_000.000_001_SPKG_MC.cwe
