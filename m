Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 120553AFC54
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Jun 2021 07:01:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC7F74205E9;
	Tue, 22 Jun 2021 07:01:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE3C642012F
	for <drbd-dev@lists.linbit.com>; Mon, 21 Jun 2021 09:07:06 +0200 (CEST)
Received: by mail-qk1-f172.google.com with SMTP id w21so14101707qkb.9
	for <drbd-dev@lists.linbit.com>; Mon, 21 Jun 2021 00:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=bQUmYtFLLQ3Bb+u86umZtg7SKz1yTxrCzWrnedZq/cQ=;
	b=mq88VSR3luadH0GCvpZTGzQIWjS3NoHbqv5WJXXV/KMu5s1si1ykICm3+baENBsf7H
	YuVWb1DBv1QmZUYOJ0+AIcFo0+I3CkiMi6pbwc8qFwcG4HZTJuSU5aSxpOB2bfGgaNYr
	3l+5Pw4EDzhwAXNOSU6+Z5jovhCJMv1nSH/6UIZwei1//Y0Gc0wcryru/eOgZmz8ZMfh
	m/LM9tdRp0LyGX/bPYe3jOh7vgWVK9FiM6mFCeYVBxi9ukp8UCeqhHrlVFnEqRfs9vzj
	C4bJDuGOH2wGjxI2u0Yol7518mAaSa6VD/Hc6lm4ajPrjq+wmVaPiU70VzVyPx6S9xsh
	zfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bQUmYtFLLQ3Bb+u86umZtg7SKz1yTxrCzWrnedZq/cQ=;
	b=h60EpnyjC7qVKTNzraKvdxbJIxwRkOvHSlzrdadF6HzPTL/fVcui2U0pPXo51ksI2O
	4k7wjUZVR8hX/wflWSIQzy8jWV6VI+VZ4/vqSgrReZbJOtsl3aCxQ7zGcDRJUMCBBg4+
	Gn+N3TktZE1haqf2zIcI0wRaKAptaJ7Mk+IjGKMbXDnQj5dr+hwZuEaVvQ9Ei8IM1y6c
	WGop37XhyiaiAAr5wgV231uMXUhc06fA15S01SXCpQ0i7LUcYLvu1LIBze0x9/lwIjIT
	23ZO2sfBIEUFvkf3ZGQ+N93qmUXLgILX2x6yG9/m08SVPAMXkYG8SQYxb2liK3104lMB
	kt4Q==
X-Gm-Message-State: AOAM533rLBONT/ZwyNkCPiv6XGthGFafRBiTSYyjpM3frJXKBepZMs/+
	h07Sw3FEHysUN9AB6ill9bLd6UsLzBuJqCpAGP1nU+FWq5U=
X-Google-Smtp-Source: ABdhPJw0UZaZuHn/yWGjogO0E3KK/M8xEYpxfB4gvQ1WecUohZTokUdh2Hqdz4Wdxtt+1diIk3oHV+k/X1cUcampKgk=
X-Received: by 2002:a25:cc55:: with SMTP id l82mr31138764ybf.26.1624259225753; 
	Mon, 21 Jun 2021 00:07:05 -0700 (PDT)
MIME-Version: 1.0
From: fei luo <morphyluo@gmail.com>
Date: Mon, 21 Jun 2021 15:06:54 +0800
Message-ID: <CAMgLiBtVkgEaTiY6UaoYcimywHmurz6-yETyKyDUdycgAOzkOA@mail.gmail.com>
To: drbd-dev@lists.linbit.com
X-Mailman-Approved-At: Tue, 22 Jun 2021 07:01:56 +0200
Subject: [Drbd-dev] Fix drbd adding volume dynamically problem
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
Content-Type: multipart/mixed; boundary="===============4813220991450296374=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============4813220991450296374==
Content-Type: multipart/alternative; boundary="0000000000002c9a7a05c5415258"

--0000000000002c9a7a05c5415258
Content-Type: text/plain; charset="UTF-8"

When I added a new volume to the drbd resource(I tested in drbd 9.0.*,
9.1.* versions), I found there is a very high probability that the resource
will block in a consistent state and never change automatically. I analyzed
the difference of logs between success and unsuccess dynamically adding
volumes. I find The failure is due to not obtaining the correct UUID yet
when calling the may_return_to_up_to_date function, so I made a patch like
below and the problem is fixed. But because drbd state is too complicated, I'm
not sure if this will introduce other problems.Hoping to get some guidance
and Hopefully this will go some way toward actually fixing the problem



---

 drbd-9.1.2/drbd/drbd_state.c | 27 +++++++++++++++++++--------

 1 file changed, 19 insertions(+), 8 deletions(-)



diff --git a/drbd-9.1.2/drbd/drbd_state.c b/drbd-9.1.2/drbd/drbd_state.c

index c45284b..0cc75df 100644

--- a/drbd-9.1.2/drbd/drbd_state.c

+++ b/drbd-9.1.2/drbd/drbd_state.c

@@ -83,7 +83,8 @@ static void sanitize_state(struct drbd_resource
*resource);

    different UUID. This function should be used if the device was
D_UP_TO_DATE

    before.

  */

-static bool may_return_to_up_to_date(struct drbd_device *device, enum
which_state which)

+static bool may_return_to_up_to_date(struct drbd_device *device, enum
which_state which,

+ bool from_md)

 {

  struct drbd_peer_device *peer_device;

  bool rv = true;

@@ -93,6 +94,15 @@ static bool may_return_to_up_to_date(struct drbd_device
*device, enum which_stat

  if (peer_device->disk_state[which] == D_DISKLESS &&

      peer_device->connection->peer_role[which] == R_PRIMARY &&

      peer_device->current_uuid != drbd_current_uuid(device)) {

+ /* here ignore peer_device->current_uuid == 0, hope reverify when

+  * peer_device->current_uuid is set

+  * */

+ if (peer_device->current_uuid == 0 && from_md) {

+ continue;

+ }

  rv = false;

  break;

  }

@@ -108,12 +118,13 @@ static bool may_return_to_up_to_date(struct
drbd_device *device, enum which_stat

  * When fencing is enabled, it may only transition from D_CONSISTENT to
D_UP_TO_DATE

  * when ether all peers are connected, or outdated.

  */

-static bool may_be_up_to_date(struct drbd_device *device, enum which_state
which) __must_hold(local)

+static bool may_be_up_to_date(struct drbd_device *device, enum which_state
which,

+ bool from_md) __must_hold(local)

 {

  bool all_peers_outdated = true;

  int node_id;



- if (!may_return_to_up_to_date(device, which))

+ if (!may_return_to_up_to_date(device, which, from_md))

  return false;



  rcu_read_lock();

@@ -216,7 +227,7 @@ enum drbd_disk_state disk_state_from_md(struct
drbd_device *device) __must_hold(

  else if (!drbd_md_test_flag(device->ldev, MDF_WAS_UP_TO_DATE))

  disk_state = D_OUTDATED;

  else

- disk_state = may_be_up_to_date(device, NOW) ? D_UP_TO_DATE : D_CONSISTENT;

+ disk_state = may_be_up_to_date(device, NOW, true) ? D_UP_TO_DATE :
D_CONSISTENT;



  return disk_state;

 }

@@ -2103,12 +2114,12 @@ static void sanitize_state(struct drbd_resource
*resource)

  /* The attempted resync made us D_OUTDATED, roll that back in case */

  if (repl_state[OLD] == L_WF_BITMAP_T && repl_state[NEW] == L_OFF &&

      disk_state[NEW] == D_OUTDATED &&

-     stable_up_to_date_neighbor(device) && may_be_up_to_date(device, NEW))

+ stable_up_to_date_neighbor(device) && may_be_up_to_date(device, NEW,
false))

  disk_state[NEW] = D_UP_TO_DATE;



  /* clause intentional here, the D_CONSISTENT form above might trigger
this */

  if (repl_state[OLD] < L_ESTABLISHED && repl_state[NEW] >= L_ESTABLISHED &&

-     disk_state[NEW] == D_CONSISTENT && may_be_up_to_date(device, NEW))

+ disk_state[NEW] == D_CONSISTENT && may_be_up_to_date(device, NEW, false))

  disk_state[NEW] = D_UP_TO_DATE;



  /* Follow a neighbor that goes from D_CONSISTENT TO D_UP_TO_DATE */

@@ -3699,7 +3710,7 @@ static int w_after_state_change(struct drbd_work *w,
int unused)

  send_new_state_to_all_peer_devices(state_change, n_device);



  if (disk_state[OLD] == D_UP_TO_DATE && disk_state[NEW] == D_CONSISTENT &&

-     may_return_to_up_to_date(device, NOW))

+ may_return_to_up_to_date(device, NOW, false))

  try_become_up_to_date = true;



  if (test_bit(TRY_TO_GET_RESYNC, &device->flags)) {

@@ -4875,7 +4886,7 @@ static bool do_change_from_consistent(struct
change_context *context, enum chang



  idr_for_each_entry(&resource->devices, device, vnr) {

  if (device->disk_state[NOW] == D_CONSISTENT &&

-     may_return_to_up_to_date(device, NOW))

+ may_return_to_up_to_date(device, NOW, false))

  __change_disk_state(device, D_UP_TO_DATE);

  }

  }

-- 

1.8.3.1

--0000000000002c9a7a05c5415258
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;fo=
nt-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt">When I added a new volume to the drbd resource(I tes=
ted in drbd 9.0.*, 9.1.* versions), I found there i</span><span style=3D"fo=
nt-family:=E5=AE=8B=E4=BD=93;font-size:11pt">s a very high probability</spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0that =
the resource will block in a consistent state and never change </span><span=
 style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">automatically</spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">. </span><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">I analyzed the =
difference </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:1=
1pt">of logs </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size=
:11pt">between success and unsucces</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt">s</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">=C2=A0dynamically adding volumes</span><span styl=
e=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">. I find </span><span s=
tyle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">The failure is </spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">due to not =
obtaining </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11=
pt">the </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt=
">correct </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11=
pt">UUID</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt=
">=C2=A0yet when calling the may_return_to_up_to_date function, so I made a=
 patch like below and the problem is fixed. </span><span style=3D"font-fami=
ly:=E5=AE=8B=E4=BD=93;font-size:11pt">B</span><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">ut because drbd state is too complicated=
, </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">I&#3=
9;m not sure if this </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;f=
ont-size:11pt">will </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;fo=
nt-size:11pt">introduce other problems</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">.</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt;text-align:justify">Hoping to get some guidance=
 and=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11=
pt">Hopefully this will go some way toward actually fixing the problem</spa=
n></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:C=
alibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font=
-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.000=
1pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt">=C2=A0</span></p><p class=3D"MsoNormal" style=
=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">---</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"M=
soNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10=
.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0d=
rbd-9.1.2/drbd/drbd_state.c | 27 +++++++++++++++++++--------</span><span st=
yle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=
=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-si=
ze:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=
=C2=A01 file changed, 19 insertions(+), 8 deletions(-)</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoN=
ormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5p=
t"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</sp=
an></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:=
Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;fon=
t-size:11pt">diff --git a/drbd-9.1.2/drbd/drbd_state.c b/drbd-9.1.2/drbd/dr=
bd_state.c</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11=
pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font=
-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt">index c45284b..0cc75df 100644</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNor=
mal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">--- a/drbd-9=
.1.2/drbd/drbd_state.c</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;=
font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0=
.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">+++ b/drbd-9.1.2/drbd/drbd_state.c</span=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><=
p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;=
font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:1=
1pt">@@ -83,7 +83,8 @@ static void sanitize_state(struct drbd_resource *res=
ource);</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"=
></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-fa=
mily:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=A0different UUID. This function s=
hould be used if the device was D_UP_TO_DATE</span><span style=3D"font-fami=
ly:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" sty=
le=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span s=
tyle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=C2=A0=C2=A0=
=C2=A0before.</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size=
:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;f=
ont-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">=C2=A0=C2=A0*/</span><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=
=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">-static bool may_retur=
n_to_up_to_date(struct drbd_device *device, enum which_state which)</span><=
span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p =
class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;fo=
nt-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t">+static bool may_return_to_up_to_date(struct drbd_device *device, enum w=
hich_state which,</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-=
size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001=
pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt">+</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt">bool from_md)</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"=
margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0{</span><span styl=
e=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"=
MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:1=
0.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=
</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">struct drbd=
_peer_device *peer_device;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0=
pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-famil=
y:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-famil=
y:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">bool rv =3D true;</span><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal=
" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">@@ -93,6 +94,15=
 @@ static bool may_return_to_up_to_date(struct drbd_device *device, enum w=
hich_stat</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-=
family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;f=
ont-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">if (peer_device-&gt;disk_state[which] =3D=3D D_DISKLESS &amp;&amp=
;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></spa=
n></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:C=
alibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font=
-size:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font=
-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size=
:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt=
">=C2=A0=C2=A0=C2=A0=C2=A0peer_device-&gt;connection-&gt;peer_role[which] =
=3D=3D R_PRIMARY &amp;&amp;</span><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0p=
t 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-fa=
mily:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-fa=
mily:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=A0peer_device-&gt;cur=
rent_uuid !=3D drbd_current_uuid(device)) {</span><span style=3D"font-famil=
y:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" styl=
e=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span st=
yle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">+</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-f=
amily:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family=
:=E5=AE=8B=E4=BD=93;font-size:11pt">/* here ignore peer_device-&gt;current_=
uuid =3D=3D 0, hope reverify when</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"mar=
gin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt">+</span><span style=3D"font-f=
amily:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family=
:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt">=C2=A0* peer_device-&gt;current_uuid is set</s=
pan><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></=
p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calib=
ri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-siz=
e:11pt">+</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0* */</=
span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span><=
/p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Cali=
bri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-si=
ze:11pt">+</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11=
pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	=
</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">if (peer_de=
vice-&gt;current_uuid =3D=3D 0 &amp;&amp; from_md) {</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNor=
mal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">+</span><spa=
n style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-fami=
ly:=E5=AE=8B=E4=BD=93;font-size:11pt">continue;</span><span style=3D"font-f=
amily:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" =
style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><spa=
n style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">+</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-fami=
ly:=E5=AE=8B=E4=BD=93;font-size:11pt">}</span><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=
=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-fami=
ly:=E5=AE=8B=E4=BD=93;font-size:11pt">rv =3D false;</span><span style=3D"fo=
nt-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNorm=
al" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt">=
<span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span>=
<span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span=
 style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span styl=
e=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"=
font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">break;</span><span style=3D"=
font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNo=
rmal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt=
"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><sp=
an style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span st=
yle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">}</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"M=
soNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10=
.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">@@ -108=
,12 +118,13 @@ static bool may_return_to_up_to_date(struct drbd_device *dev=
ice, enum which_stat</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;fo=
nt-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0=
001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=C2=A0* When fencing is enabled, it m=
ay only transition from D_CONSISTENT to D_UP_TO_DATE</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNor=
mal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=C2=A0=
* when ether all peers are connected, or outdated.</span><span style=3D"fon=
t-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNorma=
l" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><=
span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=C2=A0*/=
</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span=
></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Ca=
libri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-=
size:11pt">-static bool may_be_up_to_date(struct drbd_device *device, enum =
which_state which) __must_hold(local)</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"=
margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">+static bool may_be_up_t=
o_date(struct drbd_device *device, enum which_state which,</span><span styl=
e=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"=
MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:1=
0.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">+</spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><sp=
an style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">bool from_md) __=
must_hold(local)</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001p=
t;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt">=C2=A0{</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"=
margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt">bool all_peers_outdated =3D t=
rue;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></=
span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-famil=
y:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;f=
ont-size:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;f=
ont-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">int node_id;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;=
font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0=
.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=
=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">-</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt">if (!may_return_to_up_to_date(de=
vice, which))</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size=
:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;f=
ont-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">+</span><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt">if (!may_return_to_up_to_date(device, which, from_md))<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span>=
</p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Cal=
ibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:1=
1pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=
return false;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size=
:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;f=
ont-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin=
:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-fami=
ly:=E5=AE=8B=E4=BD=93;font-size:11pt">rcu_read_lock();</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoN=
ormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5p=
t"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">@@ -216,7 =
+227,7 @@ enum drbd_disk_state disk_state_from_md(struct drbd_device *devic=
e) __must_hold(</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-si=
ze:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt=
;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt">else if (!drbd_md_test_flag(device-&gt;ldev, MDF_WAS=
_UP_TO_DATE))</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size=
:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;f=
ont-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt">disk_state =3D D_OUTDATED;</span><span style=3D"font-fa=
mily:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" s=
tyle=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span=
 style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span=
 style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span styl=
e=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">else</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"M=
soNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10=
.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">-</span=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><spa=
n style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">disk_state =3D may_be_=
up_to_date(device, NOW) ? D_UP_TO_DATE : D_CONSISTENT;</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoN=
ormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5p=
t"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">+</span><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span s=
tyle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">disk_state =3D may_be_up=
_to_date(device, NOW, true) ? D_UP_TO_DATE : D_CONSISTENT;</span><span styl=
e=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"=
MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:1=
0.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=
</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span=
></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Ca=
libri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-=
size:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-=
size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:=
11pt">return disk_state;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0=
pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-famil=
y:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0}</span><span style=3D"font-fami=
ly:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" sty=
le=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span s=
tyle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">@@ -2103,12 +2114,12=
 @@ static void sanitize_state(struct drbd_resource *resource)</span><span =
style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=
=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-si=
ze:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=
=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=
	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</sp=
an><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">/* The attempte=
d resync made us D_OUTDATED, roll that back in case */</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoN=
ormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5p=
t"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</sp=
an><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span s=
tyle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">if (repl_state[OLD] =3D=
=3D L_WF_BITMAP_T &amp;&amp; repl_state[NEW] =3D=3D L_OFF &amp;&amp;</span>=
<span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p=
 class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;f=
ont-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11=
pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11=
pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	=
</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=C2=
=A0=C2=A0=C2=A0disk_state[NEW] =3D=3D D_OUTDATED &amp;&amp;</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D=
"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:=
10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">-</sp=
an><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span s=
tyle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=A0=
stable_up_to_date_neighbor(device) &amp;&amp; may_be_up_to_date(device, NEW=
))</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></sp=
an></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:=
Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;fon=
t-size:11pt">+</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-siz=
e:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">stable_up_to=
_date_neighbor(device) &amp;&amp; may_be_up_to_date(device, NEW, false))</s=
pan><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></=
p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calib=
ri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-siz=
e:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-siz=
e:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">disk_state[N=
EW] =3D D_UP_TO_DATE;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;f=
ont-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.=
0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"=
margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-f=
amily:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family=
:=E5=AE=8B=E4=BD=93;font-size:11pt">/* clause intentional here, the D_CONSI=
STENT form above might trigger this */</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"=
margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-f=
amily:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family=
:=E5=AE=8B=E4=BD=93;font-size:11pt">if (repl_state[OLD] &lt; L_ESTABLISHED =
&amp;&amp; repl_state[NEW] &gt;=3D L_ESTABLISHED &amp;&amp;</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D=
"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:=
10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">-</sp=
an><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span s=
tyle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0=C2=A0=C2=A0=C2=A0=
disk_state[NEW] =3D=3D D_CONSISTENT &amp;&amp; may_be_up_to_date(device, NE=
W))</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></s=
pan></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family=
:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;fo=
nt-size:11pt">+</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-si=
ze:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11=
pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	=
</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</spa=
n><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">disk_state[=
NEW] =3D=3D D_CONSISTENT &amp;&amp; may_be_up_to_date(device, NEW, false))<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span>=
</p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Cal=
ibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:1=
1pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=
	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</sp=
an><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">disk_state=
[NEW] =3D D_UP_TO_DATE;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93=
;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt =
0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=
=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-fami=
ly:=E5=AE=8B=E4=BD=93;font-size:11pt">/* Follow a neighbor that goes from D=
_CONSISTENT TO D_UP_TO_DATE */</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin=
:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font=
-family:=E5=AE=8B=E4=BD=93;font-size:11pt">@@ -3699,7 +3710,7 @@ static int=
 w_after_state_change(struct drbd_work *w, int unused)</span><span style=3D=
"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoN=
ormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5p=
t"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</sp=
an><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><s=
pan style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span s=
tyle=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">send_new_state_to_all_pe=
er_devices(state_change, n_device);</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"mar=
gin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNor=
mal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><spa=
n style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">if (disk_state[OLD] =
=3D=3D D_UP_TO_DATE &amp;&amp; disk_state[NEW] =3D=3D D_CONSISTENT &amp;&am=
p;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></sp=
an></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:=
Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;fon=
t-size:11pt">-</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-siz=
e:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=
=C2=A0=C2=A0=C2=A0=C2=A0may_return_to_up_to_date(device, NOW))</span><span =
style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=
=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-si=
ze:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">+<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><spa=
n style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">may_return_to_up_to_da=
te(device, NOW, false))</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93=
;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt =
0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">try_become_up_to_date =3D true;</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"M=
soNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10=
.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span>=
</p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Cal=
ibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:1=
1pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=
if (test_bit(TRY_TO_GET_RESYNC, &amp;device-&gt;flags)) {</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"M=
soNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10=
.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">@@ -487=
5,7 +4886,7 @@ static bool do_change_from_consistent(struct change_context =
*context, enum chang</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;fo=
nt-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0=
001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"=
margin:0pt 0pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=
=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"f=
ont-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-f=
amily:=E5=AE=8B=E4=BD=93;font-size:11pt">idr_for_each_entry(&amp;resource-&=
gt;devices, device, vnr) {</span><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0=
pt 0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-famil=
y:=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-famil=
y:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">if (device-&gt;disk_state[NOW] =3D=3D D_CONSISTEN=
T &amp;&amp;</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:=
11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;fo=
nt-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt">-</span><span style=3D"font-family:=E5=AE=8B=E4=BD=
=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;f=
ont-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:1=
1pt">=C2=A0=C2=A0=C2=A0=C2=A0may_return_to_up_to_date(device, NOW))</span><=
span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p =
class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;fo=
nt-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t">+</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span=
><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><spa=
n style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span sty=
le=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">may_return_to_up_to_da=
te(device, NOW, false))</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93=
;font-size:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt =
0.0001pt;font-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">=C2=A0</span><span style=3D"font-family:=
=E5=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=
=AE=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">	</span><span style=3D"font-family:=E5=AE=8B=E4=
=BD=93;font-size:11pt">__change_disk_state(device, D_UP_TO_DATE);</span><sp=
an style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p cl=
ass=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;font=
-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"=
>=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"=
>	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">	</s=
pan><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">}</span><=
span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span></p><p =
class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Calibri;fo=
nt-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t">=C2=A0</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11p=
t">	</span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt">}<=
/span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size:11pt"></span>=
</p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;font-family:Cal=
ibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-s=
ize:11pt">-- </span><span style=3D"font-family:=E5=AE=8B=E4=BD=93;font-size=
:11pt"></span></p><p class=3D"MsoNormal" style=3D"margin:0pt 0pt 0.0001pt;f=
ont-family:Calibri;font-size:10.5pt"><span style=3D"font-family:=E5=AE=8B=
=E4=BD=93;font-size:11pt">1.8.3.1</span><span style=3D"font-family:=E5=AE=
=8B=E4=BD=93;color:rgb(74,144,226);letter-spacing:0pt;font-size:10.5pt;back=
ground:rgb(247,248,250)"></span></p></div>

--0000000000002c9a7a05c5415258--

--===============4813220991450296374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4813220991450296374==--
