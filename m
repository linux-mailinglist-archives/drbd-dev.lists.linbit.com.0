Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B58C63F7BF
	for <lists+drbd-dev@lfdr.de>; Thu,  1 Dec 2022 19:49:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9406E421788;
	Thu,  1 Dec 2022 19:49:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
	[209.85.166.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A1B942095F
	for <drbd-dev@lists.linbit.com>; Thu,  1 Dec 2022 19:49:07 +0100 (CET)
Received: by mail-il1-f179.google.com with SMTP id o13so1133382ilc.7
	for <drbd-dev@lists.linbit.com>; Thu, 01 Dec 2022 10:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=JDuYRYaZ5b1QuEXU03cJkQKkdK9p0S+OMDir1JCIKI4=;
	b=3AsAErpKF7roU2FFrjxDlZySO29QWhSj49dScvKXe5sON8Rov1B7o6MFNhrUqBo10w
	GaXmbjun/ZtQMxETZF662rN0VH59ixEbVXTF9J5bdHYiwwwIjMRNpAro0uLkAkq0CAYE
	R5wD4hEphgVMowCRt3s9OUhCUNdOX0x2s3a5qmLJ/i3mtd4bSbnrVppCm6Ix2AWSVcd5
	ZQLJTU0ZTFXxNoP/0DGg0hgD5nMVpf15cTyqbCHI3bwfP7m7y1X2kp5S0BgZoirKHLvg
	znnytvgynfLaLiP60TP/rYNfvjP8GcjebARSUP47ChHZvZAM7tmZUXqGTrKtV8zIgRbQ
	rHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=JDuYRYaZ5b1QuEXU03cJkQKkdK9p0S+OMDir1JCIKI4=;
	b=aO8B3sYxyMJ4ER5/fBJdq3iPGPMJGtxGYaCMJYRqYvXUV7dQjXAukOA6w9DYpuPkBZ
	Jc+/zeL1/kfm4RI0f2O8xVZ+xSqj/XHl0tUZBnm1W2nTFVVADIMn5XqV3QGVgtb6k1KA
	dOkkYmMOqC6DjaUsTVSOMbqq2aeSXmGMOOEhTtKbWkj6/m719Tv80pxEcuJ6cp1U4bLL
	ALj8tGpxtRYVinouwUP6yZiBG5YZ/Gz4ar6lijBWLurS2PhkRiLZdNJNZdh4QrKs5IGT
	1/GSeZGibvm02btsfLne4qljS0rEyhZrrtA2NjoaunRmHvTk32k6f78L57ZZtILTBnmg
	BsFQ==
X-Gm-Message-State: ANoB5pmpr316dJTpp/ejwde0qNOqm+MWCM3dhBfYtB+js0M0ZoY6EFzi
	44n21fm9tK0KLLsPCkcH0OGeAQ==
X-Google-Smtp-Source: AA0mqf4eY043q8C6VOqUdL6wA+M3sn6eGOGBPd21DLffndZR/Dy1F0UUM8i/M0PcHKEU0CMvjPNNuA==
X-Received: by 2002:a92:d0c8:0:b0:303:24ea:c1e7 with SMTP id
	y8-20020a92d0c8000000b0030324eac1e7mr5947468ila.162.1669920547001;
	Thu, 01 Dec 2022 10:49:07 -0800 (PST)
Received: from [127.0.0.1] ([207.135.234.126])
	by smtp.gmail.com with ESMTPSA id
	l2-20020a922802000000b00302a00aaefasm1761404ilf.26.2022.12.01.10.49.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 01 Dec 2022 10:49:06 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221201110349.1282687-1-christoph.boehmwalder@linbit.com>
References: <20221201110349.1282687-1-christoph.boehmwalder@linbit.com>
Message-Id: <166992054601.851878.10906244874618547606.b4-ty@kernel.dk>
Date: Thu, 01 Dec 2022 11:49:06 -0700
MIME-Version: 1.0
X-Mailer: b4 0.10.2-dev-ebe49
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: [Drbd-dev] [PATCH 0/5] Backported DRBD printk/debug improvements
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gVGh1LCAwMSBEZWMgMjAyMiAxMjowMzo0NSArMDEwMCwgQ2hyaXN0b3BoIELDtmhtd2FsZGVy
IHdyb3RlOgo+IFNvbWUgY2hhbmdlcyB0byBEUkJEJ3MgbG9nZ2luZyBpbmZyYXN0cnVjdHVyZSwg
YmFja3BvcnRlZCBmcm9tIHRoZQo+IG91dC1vZi10cmVlIG1vZHVsZS4KPiAKPiBTaW5jZSB0aGUg
dHdvIGNvZGUgYmFzZXMgaGF2ZSBkaXZlcmdlZCBzbyBtdWNoLCBpdCBpcyB0b3VnaCB0byBwcmVz
ZXJ2ZQo+IGF1dGhvcnNoaXAgaW5mb3JtYXRpb24gd2l0aG91dCAicHV0dGluZyB3b3JkcyBpbnRv
IHNvbWVvbmUncyBtb3V0aCIuIFNvCj4gSSBlbmRlZCB1cCB1c2luZyBPcmlnaW5hbGx5LWZyb20g
dGFncyB0byB0cnkgYW5kIGVuY29kZSB0aGUgb3JpZ2luYWwKPiBhdXRob3JzIG9mIHRoZXNlIHBh
dGNoZXMuCj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClsxLzVdIGRyYmQ6IHVuaWZ5IGhv
dyBmYWlsZWQgYXNzZXJ0aW9ucyBhcmUgbG9nZ2VkCiAgICAgIGNvbW1pdDogYzNmODk3NDE5OGI0
MTk2NWM4ZjYyMDk5YmE5N2YxMjkzNTYxY2FiMgpbMi81XSBkcmJkOiBzcGxpdCBwb2x5bW9ycGgg
cHJpbnRrIHRvIGl0cyBvd24gZmlsZQogICAgICBjb21taXQ6IDEzNjE2MGMxNzMyZTNmODZhZmQ3
MGMxOWVjNmQxZjVlNmY3OWE3ZTkKWzMvNV0gZHJiZDogaW50cm9kdWNlIGR5bmFtaWMgZGVidWcK
ICAgICAgY29tbWl0OiBhYTAzNDY5NTk3MTEyNGY2NzNkNGNjZGQzOWNkN2YyNjk5MDRlYTg2Cls0
LzVdIGRyYmQ6IGludHJvZHVjZSBkcmJkX3JhdGVsaW1pdCgpCiAgICAgIGNvbW1pdDogZTNmYTAy
ZDdkNDIwYzdjZmI3MDc3Y2M2ZWViNjJjODg2YmE1ZmYzOQpbNS81XSBkcmJkOiBhZGQgY29udGV4
dCBwYXJhbWV0ZXIgdG8gZXhwZWN0KCkgbWFjcm8KICAgICAgY29tbWl0OiA2NzdiMzY3Mjc1Zjg3
Mjk1NDZhZWU5MThlNTQ3MDU2YTkwZGJkYzA3CgpCZXN0IHJlZ2FyZHMsCi0tIApKZW5zIEF4Ym9l
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1k
ZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5s
aW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
