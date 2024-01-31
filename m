Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 981A4844402
	for <lists+drbd-dev@lfdr.de>; Wed, 31 Jan 2024 17:24:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F17DF4205DE;
	Wed, 31 Jan 2024 17:24:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 415 seconds by postgrey-1.31 at mail19;
	Wed, 31 Jan 2024 11:03:10 CET
Received: from smtp.droid-style.com (smtp.droid-style.com [149.248.17.36])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E9434420221
	for <drbd-dev@lists.linbit.com>; Wed, 31 Jan 2024 11:03:10 +0100 (CET)
Received: from mx.droid-style.com (unknown [192.168.8.3])
	by smtp.droid-style.com (Postfix) with ESMTP id EAAD21C052F
	for <drbd-dev@lists.linbit.com>; Wed, 31 Jan 2024 17:56:12 +0800 (CST)
Authentication-Results: smtp.droid-style.com;
	none
Content-Type: text/plain; charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=droid-style.com;
	s=v2022; t=1706694972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=QHpFXeB2kxqWmwc2ZmkjqMHnZRVFSMbBZrTIGd7dAGVvwYyTpZcDX3FOuS0rwSE2kYxRTV
	rZv204KnA4ie1gDtfOnRsTSWl6oPrOM/qDb+A0FE4kN4ZI3r3UdeGHOHVTULsb4RGXVBEo
	yh4AVufnses6UfU1s8nCPhMW5gk3R8Yl8KedaW4yIlL7l1cjLYUvFG/L1I3TxkWxnDBQ3f
	M1gUjwTNr9RXps1Cr6oSqVux998Z4AflNhnmHDUgJrLjFUYKazrcLwgfaQu1mDwzb6cglh
	aCG0wLpRyMRIbdHGEZkKgxlkh1SEAsWbJYvBdQdbtanxGCG6rp1F4tVxhDGmkQ==
Content-Transfer-Encoding: 7bit
From: Qiongzhu Wan <qiongzhu@droid-style.com>
Mime-Version: 1.0
Date: Wed, 31 Jan 2024 17:56:04 +0800
Subject: subscribe
Message-Id: <6785A0D7-D9FA-43AB-A003-241190622DD5@droid-style.com>
To: drbd-dev@lists.linbit.com
X-Spamd-Bar: /
X-Mailman-Approved-At: Wed, 31 Jan 2024 17:24:17 +0100
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


