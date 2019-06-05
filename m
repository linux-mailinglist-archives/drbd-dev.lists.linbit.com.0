Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F20E427FE
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:12 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 91BAC103B4D9;
	Wed, 12 Jun 2019 15:50:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 305F01028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 18:04:05 +0200 (CEST)
Received: by mail-io1-f41.google.com with SMTP id e3so20609841ioc.12
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 09:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=YPy5fQr6ZMimo0DT/P2hv3Tw7ysLzXeuXDOfYoyT1zc=;
	b=X1oG065JwDlvaXITEdQivAF8FmQWq0fRwIg5XOhzSy0t51a6OFSCuWY5OgS2+Iv687
	rvzbs1iwFyN5I8okm6mlwoBjSZeGUtpjGqTj/01FxR8v4yZGl7oMjsBTJkqBKRuxfjGf
	EpdQMkIkR3Y2qbUZq2IX5vlNwsa/pIOskpQzgulys91uWhog8BtpTex5QddbocYp0O7L
	to4TwH+pZ8tQ0D7VWMOYLC7hw2IOOdXjQ2nfTxUGxQPD0nlZMQTTj/eyvNVPW4C2j7Y+
	QK8J9Ftw3jDmXJ6gYGA30eJ68gCdb61xercXmKuEuXGolzS+iemzow5VWmOpUHLN20+9
	YomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=YPy5fQr6ZMimo0DT/P2hv3Tw7ysLzXeuXDOfYoyT1zc=;
	b=fMM7rdFhi5yc3saU/umxQPQs0VuR/001OBHQRGR29T2JKAGyNIKYICY2RZNa5r0HIK
	0IgZ0tBQ7bpCI9O7K42MUzo5yYMXIQtMmJDfVl7CoprezspJtAYnNzj9xD5kIRgs0yTF
	a3b8zr+P0uTPyrptyF2vxinNowqhsTbCtnz9s9cVuXb350v0USwhDObqkpTn313aIlls
	4laULvN8vjm/8rFQo4vyzTgg+Fy0HHywFnMO057FwzvdLA01Oj2DxqwhMhPuz4V7BW6b
	W+qQQYvohFstrsggz8CopVYtEf7F23h9XPRUvMftSRd6DfGlC9jH4dX3i7CSUJNMJUoR
	9aSQ==
X-Gm-Message-State: APjAAAW2be+CtWwVBgzTrZrKVeedAu5csk5D0pzbQlz3N/8MUNo905vX
	3dhVSKmjA0xh1jRHQrExIarK9kPj
X-Google-Smtp-Source: APXvYqxu95Yw1yYegl4KCsFE7hzHE2rUbFKoRSDeTJhTEpsQkj8Swa3G8XqOsEcL1qVq2ICvAROW7A==
X-Received: by 2002:a5e:d612:: with SMTP id w18mr4385195iom.279.1559750645011; 
	Wed, 05 Jun 2019 09:04:05 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191])
	by smtp.gmail.com with ESMTPSA id 67sm4996415ith.16.2019.06.05.09.04.04
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 09:04:04 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <8e49689e-4fff-fbf1-eb58-7147be7c7ce7@gmail.com>
Date: Wed, 5 Jun 2019 10:03:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] comment "centi seconds" should be "deci seconds"
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Comment in drbd_limits.h refers to "centi seconds" but they appear to be units of 1/10 (deci)
rather than 1/100 (centi).  (I assume this is a bug in the comment rather than the definition)

52 /* net { */
53   /* timeout, unit centi seconds
54    *    (XXX They actually seem to be deci-seconds)
55    * more than one minute timeout is not useful */
56 #define DRBD_TIMEOUT_MIN 1
57 #define DRBD_TIMEOUT_MAX 600
58 #define DRBD_TIMEOUT_DEF 60       /* 6 seconds */
59 #define DRBD_TIMEOUT_SCALE '1'
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
