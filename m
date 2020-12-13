Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C952D9307
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 154E442066C;
	Mon, 14 Dec 2020 06:56:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
	[209.85.219.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 58C934205A9
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:15 +0100 (CET)
Received: by mail-qv1-f43.google.com with SMTP id p12so6288462qvj.13
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=544VwD3Mhs0Xuxvhsfgp5Im6wSTqZB+INCdW7VYxKkM=;
	b=XP5iX8clZGnNEApp6KmyY7Ovjd6tAqlYD9t9da6V6mmW+/8A+8Anvzg+Ae9F0QNOgG
	ASW8+M4X8EWjOXm2pN84gA7QuIoSoaJ9bfbsFdRXxb5adUHoQgS4NyoLeZ0HkhTxb/gD
	PIYw/FXIvy4uvqubEfcCsOxu1qHAHaDPwDgEy2IwFRReveuWJsI118cP4IYfffydmLYT
	DpG5/uHH6dFenecGlX2YS4rswxtIkVfdDZrbZ3/P5DFkNIcOfCWNwMdInrgY53E2oEz2
	i1Gj5fDcfEUOsXRIO24cE3ttYDqSn0zG3Mup1AOp2uVWNx81SZpvctGa6jJ87HEsOnjc
	s5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=544VwD3Mhs0Xuxvhsfgp5Im6wSTqZB+INCdW7VYxKkM=;
	b=bddOiq0n0/42x68Pqh6UFIh8xFMyRjVRRCDnHfW0Mbq/2P7Ka83HnebJoOi+WNjihi
	pzzDiFOaMWimGMRAg0FURSdur0wPDH8uygJdwMbvSU9O3YOkaWf0VlSqCUdgjDBYnIMy
	/qsxoWDEcpQiWUPwLfNQzRQa1k7BbpeYAC0sLW9L+CXoCkfgxb5N+p5nQXMOk/IeZcat
	iDoDEExuA8JFjS5qlUzLqQDQlsfUCudVgKwmNUJE/ud4OOgTnZuE9CtOpxSdALmoK89O
	PmMJt58+3SFyTEIoqf/eS78r4u6zmIHdRlrcOwmELEFVm+9LnhWwk7DjvzSSX7fLzZeT
	Eq2g==
X-Gm-Message-State: AOAM533ehB6tcb5rA6nIEZTbRYFt0ORgc7KNlE7PmAmmmzU+2axC9hcZ
	JPEGHC7kIwrmE6XM6FyLvkoc2cdff2nH2w==
X-Google-Smtp-Source: ABdhPJyRL4FQKt/2E7HHYfvWmSRgq3K1KBT7p4mYYmILzEk0O+3C9d9Isah734mreLSMPsuyrRGEDg==
X-Received: by 2002:a0c:f2cd:: with SMTP id c13mr25521050qvm.11.1607836035101; 
	Sat, 12 Dec 2020 21:07:15 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.14
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:14 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:06:56 -0500
Message-Id: <20201213050704.997-1-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] Get drbd-9.0 branch building with Linux 5.9 and 5.10
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hey, everyone! I had the chance to try building the latest drbd-9.0
code against the 5.9 and 5.10 kernels this afternoon. Things almost
built, but not quite.  I made a series of commits to get things
compiling.  Most of it is trivial compat test changes and following
along w/ what's already been done in the mainline drbd8 module to get
it ready for 5.10.

I did not create a compat test for the switch from
sched_setscheduler() to sched_set_fifo_low() yet.  Mostly, because
I've never done that and have to wrap my head around how to add
another test. ;-)

I tried submitting a pull request via github, but got the auto-close
message.  So, here's take two.


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
