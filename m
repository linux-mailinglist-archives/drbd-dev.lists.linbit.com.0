Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C28C702E12
	for <lists+drbd-dev@lfdr.de>; Mon, 15 May 2023 15:27:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EB9EC4203AB;
	Mon, 15 May 2023 15:27:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12olkn2105.outbound.protection.outlook.com
	[40.92.22.105])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B509242016E
	for <drbd-dev@lists.linbit.com>; Mon, 15 May 2023 15:26:33 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=A5dYgdYObEsa3q5u/jhO1XhnB93TBU8jg2tpvgNIJquhelqCQ+g5T0ksjwy3mjaufzfFS6f6nRJIWjs0JxSOiGdsUGp4CQ/ll1fJe08W7QBFIgVEl//a6vgbM8NdhhzE1hs1X3abojD+D9n4k1iUGGaj6e/EtckKlCSsrdQjo0bR0WhQlPe5b9EMjiEwxj/JwbZPWJpYW2yN1wDPOWr/hlaG8HCwpCm+5+w9g3SMSPNLXmWibteFUYPK057XiJDfLKieHlVmwKviWOexSsC0b6ppmEr5vuOSMb1HtZdDJzFXSxgOwHcwy58t2NCB7M9WoaMHNw1/z1GsSr73ACwzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=w6sKPrCTYa1wcJi/hSUXMxmyYnYTZwprQPUPE0hruGs=;
	b=N3Z1ls+ixh9BaA0NeThhTqQhcroL/2TktNH4NU0lKVari2ywCOwtPjt9ALXa4I8A7SqFEq3Ym3vBAFjvyFX4W5iqYlFBQpFAwdQ5Vv93+EXV09Z8Okja/kYtGBKztlEUmFiGeNsZ0pcpknT3aJ9e0UrelVRzpID+LgVCwAu3mXB6jWR4gMt3uaPVKUZBe/IuDDeYz4EjdDGheHYmEMix+Jk1HJ5l70pfXWxTVHZXLs71VFVEaELQjItYUgUKEwe8elzsPsIlopFb7XssQg/4bWHE/w7Q1G8g6ZH/wDNg+2wEK83IKncKq4nd9tJ2NaP+pNDWgXM1sRvUPefCbV1Yvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
	dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=w6sKPrCTYa1wcJi/hSUXMxmyYnYTZwprQPUPE0hruGs=;
	b=HySAe6we0wmUD+jXlrdKOIqPlGZpmk6EJ+Kle2lWgzz/QmvZoTpLfhgibSzi4WMPIqmkDykYXMPvkEqUHnxnTt9nio2HGkAktScRG2PBRvPO0wK3fBiZYTAZkCeFBXQ4uQU8AsOaghRzcfunazF1PxgfAYpXrS9PUc8ScPl2y67S84iHxSyuPIxfPHtteBocSAmHyLZ/DIuzd07mn6Hj64vux4UkijHh0lpUjOLkXFs6wjKwub+fEgoqIB9Im874+ELQQFuq1W7QpbHCFFNso9Tsx59GHP07XpLK4q7OFQUpWx1wMuupdfwpKMpg+RX91Cdl5tALmk/+yW6fvFjHWw==
Received: from CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10)
	by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30;
	Mon, 15 May 2023 13:12:00 +0000
Received: from CY5PR12MB6455.namprd12.prod.outlook.com
	([fe80::eece:c2b8:c7ea:a6]) by CY5PR12MB6455.namprd12.prod.outlook.com
	([fe80::eece:c2b8:c7ea:a6%5]) with mapi id 15.20.6387.029;
	Mon, 15 May 2023 13:12:00 +0000
From: Immad Mir <mirimmad@outlook.com>
To: =?Windows-1252?Q?Christoph_B=F6hmwalder?=
	<christoph.boehmwalder@linbit.com>
Thread-Topic: [PATCH v2] drdb: fix debugfs_create_dir and
	debugfs_create_symlink error handling
Thread-Index: AQHZhm3r9+WnhG9cY0KxiyXPoAq0FK9bCV8AgABHNqE=
Date: Mon, 15 May 2023 13:12:00 +0000
Message-ID: <CY5PR12MB645585CED318784A647D29F2C6789@CY5PR12MB6455.namprd12.prod.outlook.com>
References: <CY5PR12MB64555F99E4FEF60569050F1FC67B9@CY5PR12MB6455.namprd12.prod.outlook.com>
	<CY5PR12MB64558DB2E8ACBD592F26E61AC67B9@CY5PR12MB6455.namprd12.prod.outlook.com>
	<2ec28ec3-1e22-e772-fc9a-d59c6d176b7d@linbit.com>
In-Reply-To: <2ec28ec3-1e22-e772-fc9a-d59c6d176b7d@linbit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [jPxkFg0aMdPO9gGYhQ24aurC69mdAOqB]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6455:EE_|IA1PR12MB6138:EE_
x-ms-office365-filtering-correlation-id: fa59b2ad-92d7-4382-78be-08db5545f7e1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PyTrN7gOrzMu868Tk8KwS/l1PW1a5fLgN/pvtDGoDs8N44zITDsTnynhR6bMMcJEjA5rPfK3r+4fwU0YlJuqd9mXuUIBW79lnNxImj++sHhpT3/N8wVnwAX0q/2v07QdeTGBOXB3YsAukGpQuj+892ErQduGqMaQ52DCOJqMTcn+aBYcF994Kln3uCSfuN5crYXJyIg6rAdnrdoQi5E7/k8ekdWbNqnvbzfOh2Rol9XUvkBWilyGwCbhyYjlMWCKWx4zvd8BX59FCTtjGnyF5cI9nOTZliKcYtnNx88W5AVC+yfc+L9hzm7YjE/cWijoUkLuVKfygTNwAdEEJ8j1aG7zdfUl/z3jppTqXxTm31QhGODPZm8dqwt6Vsa9Du1AqgyMQ7f0XExQdTrYUGpFCEiXY8EEGWLNj14KMPpLSeFxoSIbsTo4vJ+87oRQX9JvjSZYQ6QlGH5JEo/aI9nORvXFKo0BpQQy9BaYylNZHyqj0ixkdKE8MVE2sJrfVqLP80TvS1r6/qBFkZUqpGPjUYLCKVK6H4ZEM1A9ZyDB7leR+7rJoGZo+q5L9OXxUQQwgU6k9TRw7UkHmKWQTlLqvTJxgr83TIjDusiJgyNMH6tMaOYFcZ2KVdhgEJcyIQ7w
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ISmd5CSudvC8DpltFWBps2Ee3yc3ryp40xbDC3NLDTAGiwTOyGz2AEEC?=
	=?Windows-1252?Q?5y8w9FVer5XXlM9v2obSRPBa4Hij2IGtwPsYyzzxUlzBLXgRwRuaeyzn?=
	=?Windows-1252?Q?cWZiDoxqirJlxOHFUx7RjQ6sEmo2B/eJG+2MXt4iagl48qOYiDjcgiMQ?=
	=?Windows-1252?Q?tRe5evjnHY/5dt+mFHu+gvaCbwYKIe3JuSb7O6eZ40z60I7dMbALca6e?=
	=?Windows-1252?Q?FfBe8XJuCMzRjJlrhYt4cGKoj/oAbZuaMVv8Vqqhgbqh/jCYPyB8ejVd?=
	=?Windows-1252?Q?63hSVj8EO8HMpJqcqTg7homcHWwKRDTHRj0HwR8wahQQEP8Xlg/JYM7G?=
	=?Windows-1252?Q?xEUD4N4/E/WwemXB0LgIGnsLW7oDrTNM7DXaflVF9j4Bx4fcgdRRdnmc?=
	=?Windows-1252?Q?ozVWrUpkCffpL+tyuvgDrU05dgmLF8Nubz1/oqngrlBQ+hyCmeBZgXTq?=
	=?Windows-1252?Q?345EsgGGbgjw/LcKzYiWDciuwQC3PKVgJ/T3BOb9vmpeF0vCu8BJ9TIQ?=
	=?Windows-1252?Q?q5eK2Vw/cTMWaub53tvtnPYNC1SS8mn9Hv17LxRwdKMLBTduDBgXSy/R?=
	=?Windows-1252?Q?SAL3PE0gnis3JnLRUf13xBBO9GL50f6yShUd3IKkKl/iooALJG3Qip7B?=
	=?Windows-1252?Q?Jj2+kFr1RFfoDTU53VmREasoSZdhJWuMODhrVZ1P3mkUKWrcAAEyxv/i?=
	=?Windows-1252?Q?hCobOVWGzDhn4zZN2cXIZGHlu59eToouitKsOhtxapoZ2VeKBevq6H7g?=
	=?Windows-1252?Q?K9FE1wgMR2PftVpLLUshkaQcR3cgZ1oYgaT/uWC+cUNVregMAhh6FsI3?=
	=?Windows-1252?Q?OutQhSav+HXsGUrd9TnAMidFSwiVuR6lLVXEKlm/mT8iwXoQ6Y2bRJRq?=
	=?Windows-1252?Q?9UnWBJScJNiT0n8TG3jmLz0MaVy3mklQslSI/fYqyZfvmuBRwRoBOYfd?=
	=?Windows-1252?Q?iXQiWRPQE+aw0C9jQxxR9+d+dJXPJy+0JKjrbD+d9PmMnykZGGzQEtoi?=
	=?Windows-1252?Q?Bt+Hw6FAb55bIRSaV4oTxY/9b2yEVifTGLudAug3XSzBxc3O3eOTB/J/?=
	=?Windows-1252?Q?jDXbUHnifWLr2rpxkNv7AZ65vnTBjZBa+vEh4/hTQhHSvFgjmBMMmz7K?=
	=?Windows-1252?Q?ZmuHFSLdoCucNpnfQCtn015BaCveuvjEHD3MEyCF6tj/x1xuUkJT8h4U?=
	=?Windows-1252?Q?N5nxr2wqYVgzpBjLSJJT1AT5hukAR93upOLq6qcElDecu+7fAbYY6LhX?=
	=?Windows-1252?Q?tnhk7/CjiU0khbl22zladScYxvtw700xb8Su9Ymk2SqhJa+/Fi14fnmb?=
	=?Windows-1252?Q?lIeGAg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6455.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fa59b2ad-92d7-4382-78be-08db5545f7e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2023 13:12:00.2881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138
X-Mailman-Approved-At: Mon, 15 May 2023 15:27:34 +0200
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH v2] drdb: fix debugfs_create_dir and
 debugfs_create_symlink error handling
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4767500537443745057=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============4767500537443745057==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY5PR12MB645585CED318784A647D29F2C6789CY5PR12MB6455namp_"

--_000_CY5PR12MB645585CED318784A647D29F2C6789CY5PR12MB6455namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ah, Thanks for the feedback, Christopher.

Immad.
________________________________
From: Christoph B=F6hmwalder <christoph.boehmwalder@linbit.com>
Sent: Monday, May 15, 2023 2:26 PM
To: mirimmad@outlook.com <mirimmad@outlook.com>
Cc: axboe@kernel.dk <axboe@kernel.dk>; drbd-dev@lists.linbit.com <drbd-dev@=
lists.linbit.com>; lars.ellenberg@linbit.com <lars.ellenberg@linbit.com>; l=
inux-block@vger.kernel.org <linux-block@vger.kernel.org>; linux-kernel@vger=
.kernel.org <linux-kernel@vger.kernel.org>; mirimmad17@gmail.com <mirimmad1=
7@gmail.com>; philipp.reisner@linbit.com <philipp.reisner@linbit.com>; skha=
n@linuxfoundation.org <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] drdb: fix debugfs_create_dir and debugfs_create_sym=
link error handling

Am 14.05.23 um 16:10 schrieb mirimmad@outlook.com:
> From: Immad Mir <mirimmad17@gmail.com>
>
> debugfs_create_dir and debugfs_create_symlink return ERR_PTR incase of
> a failure which must be checked with the inline function IS_ERR. This
> patch attempts to do the same.
>
> Signed-off-by: Immad Mir <mirimmad17@gmail.com>
> ---
> Changes in v2:
>     - Fix indentation
>     - Fix potential memory leak
>
>  drivers/block/drbd/drbd_debugfs.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/block/drbd/drbd_debugfs.c b/drivers/block/drbd/drbd_=
debugfs.c
> index 12460b584..ab431a3f2 100644
> --- a/drivers/block/drbd/drbd_debugfs.c
> +++ b/drivers/block/drbd/drbd_debugfs.c
> @@ -781,6 +781,7 @@ void drbd_debugfs_device_add(struct drbd_device *devi=
ce)
>
>        snprintf(vnr_buf, sizeof(vnr_buf), "%u", device->vnr);
>        dentry =3D debugfs_create_dir(vnr_buf, vols_dir);
> +    if (IS_ERR(dentry)) goto fail;
>        device->debugfs_vol =3D dentry;
>
>        snprintf(minor_buf, sizeof(minor_buf), "%u", device->minor);
> @@ -789,9 +790,15 @@ void drbd_debugfs_device_add(struct drbd_device *dev=
ice)
>        if (!slink_name)
>                goto fail;
>        dentry =3D debugfs_create_symlink(minor_buf, drbd_debugfs_minors, =
slink_name);
> -     device->debugfs_minor =3D dentry;
> -     kfree(slink_name);
> -     slink_name =3D NULL;
> +    if (!IS_ERR(dentry)) {
> +        device->debugfs_minor =3D dentry;
> +        kfree(slink_name);
> +        slink_name =3D NULL;
> +    } else {
> +        kfree(slink_name);
> +        slink_name =3D NULL;
> +        goto fail;
> +    }
>
>  #define DCF(name)    do {                                    \
>        dentry =3D debugfs_create_file(#name, 0440,       \
> --
> 2.40.0
>
>

Hi, thanks for the patch.

Please see this commit:

commit d27e84a305980ac61df0a6841059d0eb09b8283d
Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Tue Jun 18 17:45:49 2019 +0200

    block: drbd: no need to check return value of debugfs_create functions

    When calling debugfs functions, there is no need to ever check the
    return value.  The function can work or not, but the code logic should
    never do something different based on this.

Also, it still looks like that whitespace is garbled.

NAK.

--
Christoph B=F6hmwalder
LINBIT | Keeping the Digital World Running
DRBD HA =97  Disaster Recovery =97 Software defined Storage

--_000_CY5PR12MB645585CED318784A647D29F2C6789CY5PR12MB6455namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Ah, Thanks&nbsp;for the feedback, Christopher.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Immad.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christoph B=F6hmwalde=
r &lt;christoph.boehmwalder@linbit.com&gt;<br>
<b>Sent:</b> Monday, May 15, 2023 2:26 PM<br>
<b>To:</b> mirimmad@outlook.com &lt;mirimmad@outlook.com&gt;<br>
<b>Cc:</b> axboe@kernel.dk &lt;axboe@kernel.dk&gt;; drbd-dev@lists.linbit.c=
om &lt;drbd-dev@lists.linbit.com&gt;; lars.ellenberg@linbit.com &lt;lars.el=
lenberg@linbit.com&gt;; linux-block@vger.kernel.org &lt;linux-block@vger.ke=
rnel.org&gt;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org=
&gt;;
 mirimmad17@gmail.com &lt;mirimmad17@gmail.com&gt;; philipp.reisner@linbit.=
com &lt;philipp.reisner@linbit.com&gt;; skhan@linuxfoundation.org &lt;skhan=
@linuxfoundation.org&gt;<br>
<b>Subject:</b> Re: [PATCH v2] drdb: fix debugfs_create_dir and debugfs_cre=
ate_symlink error handling</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 14.05.23 um 16:10 schrieb mirimmad@outlook.com:=
<br>
&gt; From: Immad Mir &lt;mirimmad17@gmail.com&gt;<br>
&gt; <br>
&gt; debugfs_create_dir and debugfs_create_symlink return ERR_PTR incase of=
<br>
&gt; a failure which must be checked with the inline function IS_ERR. This<=
br>
&gt; patch attempts to do the same.<br>
&gt; <br>
&gt; Signed-off-by: Immad Mir &lt;mirimmad17@gmail.com&gt;<br>
&gt; ---<br>
&gt; Changes in v2:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Fix indentation<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; - Fix potential memory leak<br>
&gt; <br>
&gt;&nbsp; drivers/block/drbd/drbd_debugfs.c | 13 ++++++++++---<br>
&gt;&nbsp; 1 file changed, 10 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/block/drbd/drbd_debugfs.c b/drivers/block/drbd/dr=
bd_debugfs.c<br>
&gt; index 12460b584..ab431a3f2 100644<br>
&gt; --- a/drivers/block/drbd/drbd_debugfs.c<br>
&gt; +++ b/drivers/block/drbd/drbd_debugfs.c<br>
&gt; @@ -781,6 +781,7 @@ void drbd_debugfs_device_add(struct drbd_device *d=
evice)<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(vnr_buf, sizeof(vnr=
_buf), &quot;%u&quot;, device-&gt;vnr);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dentry =3D debugfs_create_di=
r(vnr_buf, vols_dir);<br>
&gt; +&nbsp;&nbsp;&nbsp; if (IS_ERR(dentry)) goto fail;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device-&gt;debugfs_vol =3D d=
entry;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(minor_buf, sizeof(m=
inor_buf), &quot;%u&quot;, device-&gt;minor);<br>
&gt; @@ -789,9 +790,15 @@ void drbd_debugfs_device_add(struct drbd_device *=
device)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!slink_name)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto fail;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dentry =3D debugfs_create_sy=
mlink(minor_buf, drbd_debugfs_minors, slink_name);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; device-&gt;debugfs_minor =3D dentry;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; kfree(slink_name);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; slink_name =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp; if (!IS_ERR(dentry)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device-&gt;debugfs_minor =
=3D dentry;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(slink_name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slink_name =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(slink_name);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slink_name =3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto fail;<br>
&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; <br>
&gt;&nbsp; #define DCF(name)&nbsp;&nbsp;&nbsp; do {&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dentry =3D debugfs_create_fi=
le(#name, 0440,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; --<br>
&gt; 2.40.0<br>
&gt; <br>
&gt; <br>
<br>
Hi, thanks for the patch.<br>
<br>
Please see this commit:<br>
<br>
commit d27e84a305980ac61df0a6841059d0eb09b8283d<br>
Author: Greg Kroah-Hartman &lt;gregkh@linuxfoundation.org&gt;<br>
Date:&nbsp;&nbsp; Tue Jun 18 17:45:49 2019 +0200<br>
<br>
&nbsp;&nbsp;&nbsp; block: drbd: no need to check return value of debugfs_cr=
eate functions<br>
<br>
&nbsp;&nbsp;&nbsp; When calling debugfs functions, there is no need to ever=
 check the<br>
&nbsp;&nbsp;&nbsp; return value.&nbsp; The function can work or not, but th=
e code logic should<br>
&nbsp;&nbsp;&nbsp; never do something different based on this.<br>
<br>
Also, it still looks like that whitespace is garbled.<br>
<br>
NAK.<br>
<br>
-- <br>
Christoph B=F6hmwalder<br>
LINBIT | Keeping the Digital World Running<br>
DRBD HA =97&nbsp; Disaster Recovery =97 Software defined Storage<br>
</div>
</span></font></div>
</body>
</html>

--_000_CY5PR12MB645585CED318784A647D29F2C6789CY5PR12MB6455namp_--

--===============4767500537443745057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4767500537443745057==--
