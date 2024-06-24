Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE76915E26
	for <lists+drbd-dev@lfdr.de>; Tue, 25 Jun 2024 07:30:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F5BE4205A5;
	Tue, 25 Jun 2024 07:30:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6D8FE420324
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 16:21:26 +0200 (CEST)
Received: by mail-qk1-f175.google.com with SMTP id
	af79cd13be357-7961fb2d1cfso341312885a.0
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dreamsnake-net.20230601.gappssmtp.com; s=20230601; t=1719238885;
	x=1719843685; darn=lists.linbit.com; 
	h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
	:from:from:to:cc:subject:date:message-id:reply-to;
	bh=vyM7SpnmS6E42kucj9mVuoblNwWj8XmJP/H7ZZM8ROY=;
	b=oBDSiiDJG81izLXIjmRldvuRSZ65ggBldIpfEXb+DbdX01XZceXdHtBAXHUOsk7oJX
	0qQLCbHAAgUnp427Sh06h3Hh/Yt7e/SQRbk2CLhH7IsMqiSvOdKu5QtaW9ZHOg4zkkOB
	ExBl6pQBDCU1Ty/okwUk7nx1RsGruvsvas7sETYM7z3Y4lSPOjG6DnvFAK05+1G3GiwB
	SXEet1i6oKeRVWd/M6R7JqAjOCwYw9jFMNUn1sFj2HCBbqTZwBKn4N7Y4mgP9rMU1TK9
	/HPoacK8viw0PMMDMYBB6ddY7rKtEQvgRH9XUxTHM56PuOKReeXtNtnwpd+3CWFQbuPf
	e9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719238885; x=1719843685;
	h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
	:from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=vyM7SpnmS6E42kucj9mVuoblNwWj8XmJP/H7ZZM8ROY=;
	b=iZX84G78IEfrl97uE+SyWJgMWIz9xynlWuo/LwBYIl9IaRHwObFuIXRZCC5/AB0kk1
	sMjMiScOU8Yv9n3Tu+a32vZGWTInx1jBziv3oFQFIeHbBrb2BC16Kxt4DLfMTkC0UovN
	757AAFSnw4MteiFLsUUYw0VDTyRpAjLJ1E+xgLCY1BXv6sUbl/0Z7IsIVVOwdpM9qH4Q
	phtfCKBsuSiK9xrNKLuaulEiIIjBkRBxa0BuetTPPSjyiZVPYHoSl+V5ZmW3CTvcDchA
	Z8HMu9++uKsLX6yhldserc0c9Dr2T6RZyX8DKp5Yq6MTLSSpTs1feySjDCusyi6x4s5U
	xi7w==
X-Forwarded-Encrypted: i=1;
	AJvYcCWD91GpCe74eJc4baw7nZj7wVJEivO50DeJqnUtTncB6sljCpId7nlu/p8Yv2wbFG/P5Y01M6q/TJHzG1NLfZBTvoA83kPKIdVZ
X-Gm-Message-State: AOJu0YyzVLDGoc1N4o7n2HrLDBkt+dY2AlK5wWgCXDsrL8FRCxULIA0t
	TQhCGvVHukfJhG3e9l0huqHXSPOQtOBlhpXqzbYqh/aLt6w7khdnE8sULXZt
X-Google-Smtp-Source: AGHT+IHXYJoHqe+lVWeHEvpL31lPzpeMHrumwGR4d2Z3MDIXugyalKxqFS2lKuqDdFuxVAxlh+r7+g==
X-Received: by 2002:a0c:f594:0:b0:6b5:50ba:42c3 with SMTP id
	6a1803df08f44-6b550ba45a4mr31114516d6.43.1719238885298; 
	Mon, 24 Jun 2024 07:21:25 -0700 (PDT)
Received: from smtpclient.apple (pool-100-6-75-225.pitbpa.fios.verizon.net.
	[100.6.75.225]) by smtp.gmail.com with ESMTPSA id
	6a1803df08f44-6b51ef30ef9sm34454366d6.76.2024.06.24.07.21.24
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2024 07:21:24 -0700 (PDT)
From: Anthony D'Atri <aad@dreamsnake.net>
Message-Id: <1E6AF1FD-5E2B-49D6-B42E-1BEA85BA7E93@dreamsnake.net>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [axboe-block:for-next] [block] bd4a633b6f: fsmark.files_per_sec
	-64.5% regression
Date: Mon, 24 Jun 2024 10:21:13 -0400
In-Reply-To: <Znl4lXRmK2ukDB7r@ryzen.lan>
To: Niklas Cassel <cassel@kernel.org>
References: <202406241546.6bbd44a7-oliver.sang@intel.com>
	<20240624083537.GA19941@lst.de> <Znl4lXRmK2ukDB7r@ryzen.lan>
X-Mailer: Apple Mail (2.3774.600.62)
X-Mailman-Approved-At: Tue, 25 Jun 2024 07:30:12 +0200
Cc: nvdimm@lists.linux.dev, feng.tang@intel.com, linux-nvme@lists.infradead.org,
	fengwei.yin@intel.com, linux-mtd@lists.infradead.org,
	linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	lkp@intel.com, linux-scsi@vger.kernel.org, ying.huang@intel.com,
	xen-devel@lists.xenproject.org, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, virtualization@lists.linux.dev,
	nbd@other.debian.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>, ceph-devel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <oliver.sang@intel.com>,
	oe-lkp@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com


--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

S3610 I think.  Be sure to use sst or the chassis vendor=E2=80=99s tool =
to update the firmware.

> On Jun 24, 2024, at 9:45=E2=80=AFAM, Niklas Cassel <cassel@kernel.org> =
wrote:
>=20
> SSDSC2BG012T4


--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">S3610 I think. =
&nbsp;Be sure to use sst or the chassis vendor=E2=80=99s tool to update =
the firmware.<br id=3D"lineBreakAtBeginningOfMessage"><div><br><blockquote=
 type=3D"cite"><div>On Jun 24, 2024, at 9:45=E2=80=AFAM, Niklas Cassel =
&lt;cassel@kernel.org&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 18px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">SSDSC2BG012T4</span></div></blockquote></div><br></body></htm=
l>=

--Apple-Mail=_C8799745-5BE2-4755-A5E5-5C731F6565EF--
