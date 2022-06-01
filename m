Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4F253B3B3
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Jun 2022 08:41:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8905A4202BA;
	Thu,  2 Jun 2022 08:41:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 60152420162
	for <drbd-dev@lists.linbit.com>; Wed,  1 Jun 2022 16:03:29 +0200 (CEST)
Received: by mail-pf1-f181.google.com with SMTP id y189so2054586pfy.10
	for <drbd-dev@lists.linbit.com>; Wed, 01 Jun 2022 07:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sourceruckus-org.20210112.gappssmtp.com; s=20210112;
	h=mime-version:from:date:message-id:subject:to;
	bh=CcipWEDaeBhmKgkldLuzSfY9tzMIOuF9IfkIdVRcJ/Q=;
	b=As8gwJ8InnhhYhrc0r1KK631upGZe7sfegURCYt6fK6gKYU+zXvE/Mj/iMsiWOGN2I
	9bK5hBKthHQLn6yu8oA+nuoPBcZSrtGf0jWPZHRIRrotISqKEyh2Vi1Z3xtB9yhh4n/i
	wUgI27/UTIQacfTVdi7FPImQ/leKzsEQnmzzJPEUonq+fhYYCVksczut5cfB9eedfX1S
	JdKCRFFfvb3SOq6bqV8PM7SrGNVofbgAzTt0uOENpuMmcbAMPFdhJCqOSeZet5PQSDHE
	NFhkYd0zrmNeQtDDNYMZPULnPwkK1dTYAFgwY2mHzGbgzr44QkDMV9e7fa/Rlb5D10GG
	9A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CcipWEDaeBhmKgkldLuzSfY9tzMIOuF9IfkIdVRcJ/Q=;
	b=zMs86+FzFkrzlIO6Jv+BzUz2985rbAYVeQiuXGus9Dq8FzaMy/X/kxjEL0TWeTzXYw
	zAFqZT77HniwHST4qXIHpV4mMJErF/pJObUm894popYoUFeP9pNsH2b3UYF3wYmTfrWS
	Eddfi79Pj2WdYgeUgACd/d6qXXB9k7QMK0cwWfEShQnBfklugA23ebgvZ5iGjicRZaD6
	IUL6QV453Bu/zAgR0RH1sVWIMBIQ5fGE/ei645i5DnMoX68ThboECTBV6x7OzGk5EOHB
	2tw8QdbSAtojO0eI7qryJsbVvIEDc2yhXQQEesd49DdpI8psIy30VBnmhxPPIzhb5nIQ
	tlIA==
X-Gm-Message-State: AOAM5318H3rqrSi9TXsCStxXQwwurkVzetz/Tf5sXOvHKMEuSTE+AkL9
	oJEK8/WVmV0+MSCuxdGeKgQKlRnIHlvz4hMwGEUHWKytlCKUgj8u
X-Google-Smtp-Source: ABdhPJyesw8gLvikWOtVmiUfHUNLcklt2e7ZCJuM8hQuRxADGmq/u860MSuHAGMXAU1Qrwe/DxXAUe+ardw04clVkJA=
X-Received: by 2002:a05:6a00:22d5:b0:518:806e:5829 with SMTP id
	f21-20020a056a0022d500b00518806e5829mr56251pfj.54.1654092208844;
	Wed, 01 Jun 2022 07:03:28 -0700 (PDT)
MIME-Version: 1.0
From: Michael Labriola <veggiemike@sourceruckus.org>
Date: Wed, 1 Jun 2022 10:03:18 -0400
Message-ID: <CAA1fRFhZrTfHegCWwNoSsUkmvBBfFmd9viQVsmCpSMFQNH5vTg@mail.gmail.com>
To: drbd-dev@lists.linbit.com
X-Mailman-Approved-At: Thu, 02 Jun 2022 08:41:10 +0200
Subject: [Drbd-dev] Linux 5.18 status
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Ahoy!  Looks like the drbd-9.1 branch doesn't compile against 5.18
yet.  Is somebody working through the 5.18 block layer changes
already?  If anyone's got a branch to test, I'd gladly try it out.

--
Michael D Labriola
401-316-9844 (cell)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
