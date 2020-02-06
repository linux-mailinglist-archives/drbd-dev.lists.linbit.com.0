Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E825B17A603
	for <lists+drbd-dev@lfdr.de>; Thu,  5 Mar 2020 14:06:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A8DF24203FC;
	Thu,  5 Mar 2020 14:06:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1311 seconds by postgrey-1.31 at mail19;
	Thu, 06 Feb 2020 11:32:21 CET
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 64C9C4203C2
	for <drbd-dev@lists.linbit.com>; Thu,  6 Feb 2020 11:32:21 +0100 (CET)
Received: by mail-io1-f43.google.com with SMTP id m25so5723460ioo.8
	for <drbd-dev@lists.linbit.com>; Thu, 06 Feb 2020 02:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jUI3PW7kZ2bGKIPU1sbtlIpYR/AUhmqhnB4cDrzjWiI=;
	b=U3XByycgJc6Ad/kh83wNRPW1tQdWUJRky+TYWukmvZvmcpPFG0uPcv1REXiEE9Ir0i
	OzESe0dqymsDyNT1it7gHVHoFdZq31Ny/TICgckl+lm8pL/2KU2Wx5oaaxl02+Zm6t/P
	BIkiHc3GcGf4G/TrIB4Xyx9CDlZAaFs85DqloRqipa4ydQJ4s1VbDusAs82rGDq8WuNH
	aTmB6bvZgh5UzlhtdDjg721o0NgtqZ5c0W8RsskbSNnPEx1V4QWdPMIQd8IjocpShyHj
	PBVl7RHbSA7VfPTQ0VS9miRSPYgfb+x5DpK2dnZouBiOJG3wbFfcGUXeiHyJdUd291Sp
	BQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jUI3PW7kZ2bGKIPU1sbtlIpYR/AUhmqhnB4cDrzjWiI=;
	b=jFXnbd3uez6FGyD3AyhFmr/j809kQxiVrxC0glyrR5yNXjo2/rr3RIFz+EPSk/+qBA
	A5sUivUUQkHFK3AAS8X5QVHzwIT05/zcfOQTMKKkDjd22Cs2Km5Y/Ykf0oCJCnkD6VU8
	5fvlaZ7+oXJReHvZ4DjRTZVuTvOREhwlROOomLgdQ4zduhqPRJZANvvhZb2vno58pOp+
	JGCXAyWJomiY8X5HJ7HRtXKGyUYutUwHGcDi/cOQP9cPsKV1uGnEapE/HqdOi9PmOIEL
	/a7KWzE9e5lBbawsSfFvMXMiDakxvuQtxauiYEfKo4/k2Jszj/aIStBfD4EV8bp3rpWx
	dC3w==
X-Gm-Message-State: APjAAAXPx+sSH05rn8uiuqQv0WadtBFhqueGpMZs+KsCwR4lQ8vLD3QU
	QEn1zUqhi9QoUZBrEpfaSPvPIO+zcZha3q7gYNvltw==
X-Google-Smtp-Source: APXvYqwklQz3r8Sz2kgWeX1bhqD1532shC05U8m606f8yyUJ6D2/dE6EbslhLAHLYMz0MJkGxO/Ou5VXkiTqp3SSMlo=
X-Received: by 2002:a6b:fa0e:: with SMTP id p14mr8414315ioh.155.1580983768696; 
	Thu, 06 Feb 2020 02:09:28 -0800 (PST)
MIME-Version: 1.0
From: Mona Sinha <monasinha194@gmail.com>
Date: Thu, 6 Feb 2020 15:39:17 +0530
Message-ID: <CABf4PgnpksYvoadxKtYfG4Nek=s6ZaYUWhyXWNO_fJj_vswwpw@mail.gmail.com>
To: drbd-dev@lists.linbit.com
X-Mailman-Approved-At: Thu, 05 Mar 2020 14:06:47 +0100
Subject: [Drbd-dev] DRBD full resync scanario
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
Content-Type: multipart/mixed; boundary="===============4588386805430004541=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============4588386805430004541==
Content-Type: multipart/alternative; boundary="000000000000edcf02059de57758"

--000000000000edcf02059de57758
Content-Type: text/plain; charset="UTF-8"

Hello,

I am interested to know that in case of a primary-secondary server with
single primary drbd mode undergoing full resync, what will happen in case
of failover?
Will the secondary server get promoted to primary or not? If not, will it
send any error?

Regards,
Mona

--000000000000edcf02059de57758
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I am interested to know that in =
case of a primary-secondary server with single primary drbd mode undergoing=
 full resync, what will happen in case of failover?</div><div>Will the seco=
ndary server get promoted to primary or not? If not, will it send any error=
?</div><div><br></div><div>Regards,</div><div>Mona</div></div>

--000000000000edcf02059de57758--

--===============4588386805430004541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4588386805430004541==--
