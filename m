Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15DAFD5DF
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Jul 2025 20:00:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 12E0E16227D;
	Tue,  8 Jul 2025 20:00:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 86CE116095D
	for <drbd-dev@lists.linbit.com>; Tue,  8 Jul 2025 20:00:17 +0200 (CEST)
Received: by mail-io1-f41.google.com with SMTP id
	ca18e2360f4ac-875ce3c8e24so170593539f.1
	for <drbd-dev@lists.linbit.com>; Tue, 08 Jul 2025 11:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751997616;
	x=1752602416; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=BTaZVsYCFHrHcx2ton4bjQXkjChOR0CFYCOoEbLvagw=;
	b=cmCEM/OtmpeR3Ss3zH/wvLCwzLHdA1+hltF4tUpq4cuKWxw9JpTgfeQQgxQ4/C4DWV
	CP0xoO1JgUGq6spXJJGI6KVCs27a56Nrau/bm7owTyB5eGLj2uDAiCYiDr9EBXkwUeua
	B72VXF6v/tlGog4FJ/fuflpO4TPU7Njh2SxjwygQ97Q6NMblmPuEHcDfFMMfZ1SnPHSe
	3xm8Mitw+/j88LTc6tZ2lYodVbRslbAUgAaii8jDmxyLndvGjupa+uz0cdPBRjPsE3Ua
	XZDakJSZ9zuVYXDBpJ43nzU5L3lLpuYumIUnTTE3aXcpu408iKuaQ5I9Q/bN/aD9rsT8
	Muog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1751997616; x=1752602416;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=BTaZVsYCFHrHcx2ton4bjQXkjChOR0CFYCOoEbLvagw=;
	b=TimGlIz2FZ9EnN2T5SE8QH+bORtWrzLHqqgmRYWHWO+E3ECplP4op1DegINvCir3XH
	1+4pFnrx+apqRDMuC82qPcY+zRcjwKjKC0Ru4AqiRzw4xr5NVH7J+iy29jDhhWdlJ6Cb
	oJpZfLuOfua7O1YRb8G4aMg+thfb99sbEbIPeDOc1KBmwGfbxqVDoJRBmzn4db2hxl1F
	mmIo/ORSQxM/1fM9y5gE0yuEZ8jXxFKmiKeDmtEwjk+4PgDZkO6L3DqJyMJ8ZYGOqnfF
	E5kyndFOVejEEyiUK5ZMXi8N59TqBxpiOLOT5OCT/0tVgov6sfGBRYIaEU6cofrMJOKq
	Sf7Q==
X-Gm-Message-State: AOJu0YwqzDmXAMrKu8I2mqZfy1XCw/G+nkn1WekIHRgdQPUthtCV7yVX
	o5p8YAmy77ssUoX6VD4dtVd6T40fawAthNx+z1di7NxuYwOMkkvg7tCFGwKr6qIyQ/w=
X-Gm-Gg: ASbGncvcLcl1m7CM7bJLg8PTRJZDxSU/wyOzlw+O9hPCb71kqqzO8l7EU7wyvbTMfP8
	o+pKJRY5oYh3muCEcuZtAZXsbsiqoqlxtvWRRq6f1gE3avlxwz4l1OxRDNfPIKgAesv3TgISmFL
	3aRwigh0sKLGbbL7DHPUE1Qeg9TMjUMe4/BWvo2GIdVvTIQyjzj7F6Z9ly44b82MP3onfzVVqNR
	awuCmOqfZWNnKUbYBLTz0Y4QTng+APyznpIyjntMpmbA8gNIfNLIKrvXEepx8Pugj0hC6vKb8HD
	uyXUfRFRlVFfGiR81w2ixOwbre812JGjVFdTBNflsscm2s6VM+IM
X-Google-Smtp-Source: AGHT+IGf7DhyE6cPFBeAzzxZ7ZZkWyuGsVu+jmKXb2eDm4gaRTMXmMIKPbVUJim0L6HTPNaocIyEWQ==
X-Received: by 2002:a05:6e02:18cc:b0:3dd:d995:30ec with SMTP id
	e9e14a558f8ab-3e153a67248mr59069015ab.12.1751997616011; 
	Tue, 08 Jul 2025 11:00:16 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	8926c6da1cb9f-503b59c72bbsm2276958173.38.2025.07.08.11.00.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Jul 2025 11:00:14 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20250627095728.800688-1-christoph.boehmwalder@linbit.com>
References: <20250627095728.800688-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: add missing kref_get in handle_write_conflicts
Message-Id: <175199761446.1185853.16712742207654241158.b4-ty@kernel.dk>
Date: Tue, 08 Jul 2025 12:00:14 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3-dev-d7477
Cc: Lars Ellenberg <lars@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Sarah Newman <srn@prgmr.com>, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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


On Fri, 27 Jun 2025 11:57:28 +0200, Christoph Böhmwalder wrote:
> With `two-primaries` enabled, DRBD tries to detect "concurrent" writes
> and handle write conflicts, so that even if you write to the same sector
> simultaneously on both nodes, they end up with the identical data once
> the writes are completed.
> 
> In handling "superseeded" writes, we forgot a kref_get,
> resulting in a premature drbd_destroy_device and use after free,
> and further to kernel crashes with symptoms.
> 
> [...]

Applied, thanks!

[1/1] drbd: add missing kref_get in handle_write_conflicts
      commit: 00c9c9628b49e368d140cfa61d7df9b8922ec2a8

Best regards,
-- 
Jens Axboe



