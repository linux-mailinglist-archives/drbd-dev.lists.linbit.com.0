Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F817A602
	for <lists+drbd-dev@lfdr.de>; Thu,  5 Mar 2020 14:06:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 80F844203F8;
	Thu,  5 Mar 2020 14:06:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1449 seconds by postgrey-1.31 at mail19;
	Thu, 06 Feb 2020 03:18:36 CET
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EFFED420388
	for <drbd-dev@lists.linbit.com>; Thu,  6 Feb 2020 03:18:36 +0100 (CET)
Received: by mail-yb1-f195.google.com with SMTP id o199so178588ybc.4
	for <drbd-dev@lists.linbit.com>; Wed, 05 Feb 2020 18:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H/vcj/nYTrFLZE+L/jvH9vCgJnLzOfXDh9z4xthKHZs=;
	b=MrDHWRpbC1Uju0XCkriREwK6pY6bw/UCd7SiNTKSCOnhs4meOfGjwOGKfc524NTghg
	5Mm8trDcDei2rQQfP86RNsOjh5FHru1CLvJDp/bAY6qZv8aXDLxJx/+tAJJibzP+Y/Hy
	Y2rVz44OMQhibdedm5YjITDuS7Uh9sxnRHDU+1Q/KwQkZ1uK9JJ9QlcU9jP17tzHIti4
	Kw1qzrNgUYrv5Bq3dzUk2X4ZhS/EJk0ukpNMNve9p8P5g/4RXHVWu+03/ijGdmabwqda
	bnmZxl43MJDMyySrVj48lDUKNhHhcpLJsOSf79JdH9BB3if16TurFt34Sz2tEOp0Ryqt
	hBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H/vcj/nYTrFLZE+L/jvH9vCgJnLzOfXDh9z4xthKHZs=;
	b=R0jAqftpv0EJjapdeDgDVxJFHeu1Aal6TUTod8sIYRt4V7+LCpiry1BXNtgbWyMT5J
	Ur8JjYkz0OyfiNG5mc/C10aFTvFKXaJDMK7FK572Zmg94u/BAYtpT1DX8PtunsrF9IHE
	uyTjCpzBR1iCDZ+YtIZPGh4KffVhwNz1vC9nCi9uw6YP3TJexDrldbnbsjrv/zoWvQ0Y
	9WazhRL7GpLELkpVUfTXjDjF4qljjTPXsrH1jG3aA6MxmfbKcHFoHwLs8gMXNcxn9JUs
	cUZk3ac9eH2LhdG7HmhgrIlvfd82iUeJ+B3s+qKwWbRBxN7fz9dn7cN9a+jWOR+9sd5S
	9XRw==
X-Gm-Message-State: APjAAAU4kImWkB02doH0FWJUlnxM5W3FpRR6r9f9GrTgzslnNpNAOFun
	GJQFes0KvcJHwhHSK8yoVgJPm2xpLFmy2qRGrtIWiA==
X-Google-Smtp-Source: APXvYqw/xwTG31rj7UA4/Su70TzY235m6iDn1D97UDhxuN21rUG36UeAPfHnurqm0j4HK3GL3tEuVcTMRgCYt8ycOiM=
X-Received: by 2002:a9d:5786:: with SMTP id q6mr27841325oth.164.1580953458993; 
	Wed, 05 Feb 2020 17:44:18 -0800 (PST)
MIME-Version: 1.0
References: <CA+qeAOqyL5fDoFUXxVD0iaYSpY9P1qNH0Hd7eUUyGCg6hznKRQ@mail.gmail.com>
In-Reply-To: <CA+qeAOqyL5fDoFUXxVD0iaYSpY9P1qNH0Hd7eUUyGCg6hznKRQ@mail.gmail.com>
From: Dongsheng Yang <dongsheng081251@gmail.com>
Date: Thu, 6 Feb 2020 09:44:07 +0800
Message-ID: <CA+qeAOpn85PevU6yxKqyt358ZVhdmLfwdaxvcpi4vy32Y4u8Mg@mail.gmail.com>
To: lars.ellenberg@linbit.com, philipp.reisner@linbit.com, 
	linux-block@vger.kernel.org, joel.colledge@linbit.com, 
	drbd-dev@lists.linbit.com
X-Mailman-Approved-At: Thu, 05 Mar 2020 14:06:47 +0100
Cc: duan.zhang@easystack.cn
Subject: [Drbd-dev] Fwd: Bug Report : meet an unexcepted WFBitMapS status
 after restarting the primary
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
Content-Type: multipart/mixed; boundary="===============3467428637025056996=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============3467428637025056996==
Content-Type: multipart/alternative; boundary="00000000000054705f059dde691f"

--00000000000054705f059dde691f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp and Lars,
     Any suggestions?

Thanx
---------- Forwarded message ---------
=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A Dongsheng Yang <dongsheng081251@gmail.=
com>
Date: 2020=E5=B9=B42=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=
=887:06
Subject: Bug Report : meet an unexcepted WFBitMapS status after restarting
the primary
To: <joel.colledge@linbit.com>
Cc: <drbd-dev@lists.linbit.com>, <duan.zhang@easystack.cn>


Hi guys,

Version: drbd-9.0.21-1

Layout: drbd.res within 3 nodes -- node-1(Secondary), node-2(Primary),
node-3(Secondary)

Description:
a.reboot node-2 when cluster is working.
b.re-up the drbd.res on node-2 after it restarted.
c.an expected resync from node-3 to node-2 happens. When the resync is
done, however,
  node-1 raises an unexpected WFBitMapS repl status and can't recover to
normal anymore.

Status output:

node-1: drbdadm status

drbd6 role:Secondary

disk:UpToDate

hotspare connection:Connecting

node-2 role:Primary

replication:WFBitMapS peer-disk:Consistent

node-3 role:Secondary

peer-disk:UpToDate


node-2: drbdadm status

drbd6 role:Primary

disk:UpToDate

hotspare connection:Connecting

node-1 role:Secondary

peer-disk:UpToDate

node-3 role:Secondary

peer-disk:UpToDate

I assume that there is a process sequence below according to my source code
version:
node-1                                           node-2
                                       node-3
        restarted with CRASHED_PRIMARY
        start sync with node-3 as target
 start sync with node-2 as source
        =E2=80=A6                                                          =
      =E2=80=A6
                                                 end sync with node-3
                                       end sync with node-2
        w_after_state_change
                      loop 1 within for loop against node-1:(a)
receive_uuids10                                  send uuid with
UUID_FLAG_GOT_STABLE&CRASHED_PRIMARY to node-1
receive uuid of node-2 with CRASHED_PRIMARY      loop 2 within for loop
against node-3:
        clear  CRASHED_PRIMARY(b)
send uuid to node-2 with UUID_FLAG_RESYNC        receive uuids10
sync_handshake to SYNC_SOURCE_IF_BOTH_FAILED     sync_handshake to NO_SYNC
change repl state to WFBitMapS

The key problem is about the order of step(a) and step(b), that is, node-2
sends the
unexpected  CRASHED_PRIMARY to node-1 though it's actually no longer a
crashed primary
after syncing with node-3.
So may I have the below questions:
a.Is this really a BUG or just an expected result?
b.If there's already a patch fix within the newest verion?
c.If there's some workaround method against this kind of unexcepted status,
since I really
  meet so many other problems like that :(

--00000000000054705f059dde691f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philipp and Lars,</div><div>=C2=A0 =C2=A0 =C2=A0An=
y suggestions?</div><div><br></div>Thanx<br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">---------- Forwarded message ---------<br=
>=E5=8F=91=E4=BB=B6=E4=BA=BA=EF=BC=9A <strong class=3D"gmail_sendername" di=
r=3D"auto">Dongsheng Yang</strong> <span dir=3D"auto">&lt;<a href=3D"mailto=
:dongsheng081251@gmail.com">dongsheng081251@gmail.com</a>&gt;</span><br>Dat=
e: 2020=E5=B9=B42=E6=9C=885=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:=
06<br>Subject: Bug Report : meet an unexcepted WFBitMapS status after resta=
rting the primary<br>To:  &lt;<a href=3D"mailto:joel.colledge@linbit.com">j=
oel.colledge@linbit.com</a>&gt;<br>Cc:  &lt;<a href=3D"mailto:drbd-dev@list=
s.linbit.com">drbd-dev@lists.linbit.com</a>&gt;,  &lt;<a href=3D"mailto:dua=
n.zhang@easystack.cn">duan.zhang@easystack.cn</a>&gt;<br></div><br><br><div=
 dir=3D"ltr"><div>Hi guys,</div><div><br></div>Version: drbd-9.0.21-1<br><b=
r>Layout: drbd.res within 3 nodes -- node-1(Secondary), node-2(Primary), no=
de-3(Secondary)<br><br>Description: <br>a.reboot node-2 when cluster is wor=
king.<br>b.re-up the drbd.res on node-2 after it restarted.<br><a href=3D"h=
ttp://c.an" target=3D"_blank">c.an</a> expected resync from node-3 to node-=
2 happens. When the resync is done, however,<br>=C2=A0 node-1 raises an une=
xpected WFBitMapS repl status and can&#39;t recover to normal anymore.<br><=
br>Status output:<br><br>node-1: drbdadm status<br><br>drbd6 role:Secondary=
<br><br>disk:UpToDate<br><br>hotspare connection:Connecting<br><br>node-2 r=
ole:Primary<br><br>replication:WFBitMapS peer-disk:Consistent<br><br>node-3=
 role:Secondary<br><br>peer-disk:UpToDate<br><br><br>node-2: drbdadm status=
<br><br>drbd6 role:Primary<br><br>disk:UpToDate<br><br>hotspare connection:=
Connecting<br><br>node-1 role:Secondary<br><br>peer-disk:UpToDate<br><br>no=
de-3 role:Secondary<br><br>peer-disk:UpToDate<br><br>I assume that there is=
 a process sequence below according to my source code version:<br>node-1 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n=
ode-2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node-3<br=
>					 =C2=A0 =C2=A0 =C2=A0 =C2=A0 restarted with CRASHED_PRIMARY =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>					 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 start sync with node-3 as target =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0start sync with node-2 as source<br>					 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =E2=80=A6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0=E2=80=A6<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0end sync with no=
de-3 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0end sync with node-2<br>					 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
w_after_state_change<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0			=
	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loop 1 within for loop against node-1:(a)<br>=
receive_uuids10 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0send uuid with U=
UID_FLAG_GOT_STABLE&amp;CRASHED_PRIMARY to node-1<br>receive uuid of node-2=
 with CRASHED_PRIMARY =C2=A0 =C2=A0 =C2=A0loop 2 within for loop against no=
de-3:<br>					 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clear =C2=A0CRASHED_PRIMARY(b)<b=
r>send uuid to node-2 with UUID_FLAG_RESYNC =C2=A0 =C2=A0 =C2=A0 =C2=A0rece=
ive uuids10<br>sync_handshake to SYNC_SOURCE_IF_BOTH_FAILED =C2=A0 =C2=A0 s=
ync_handshake to NO_SYNC<br>change repl state to WFBitMapS<br><br>The key p=
roblem is about the order of step(a) and step(b), that is, node-2 sends the=
<br>unexpected =C2=A0CRASHED_PRIMARY to node-1 though it&#39;s actually no =
longer a crashed primary<br>after syncing with node-3.<br>So may I have the=
 below questions:<br>a.Is this really a BUG or just an expected result?<br>=
b.If there&#39;s already a patch fix within the newest verion?<br>c.If ther=
e&#39;s some workaround method against this kind of unexcepted status, sinc=
e I really<br>=C2=A0 meet so many other problems like that :(=C2=A0<br></di=
v>
</div></div>

--00000000000054705f059dde691f--

--===============3467428637025056996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============3467428637025056996==--
