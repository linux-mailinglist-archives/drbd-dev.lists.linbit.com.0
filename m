Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id BC316427FC
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:06 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B22AC1028A7F;
	Wed, 12 Jun 2019 15:50:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id C6B811028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 18:01:33 +0200 (CEST)
Received: by mail-it1-f175.google.com with SMTP id h20so4284897itk.4
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=GmXs4Hptum0OCMTs4Lg+blnGN9En8J1LIfR+b94m4K0=;
	b=t5MReS3pgVb/bCB4kS313AMW2hN46wXQmEWPqF/0xaD4VIGn3HzKG4EZwMSFJALqxp
	v2wn9w6Y4VfudZNVsf6D1adDBhLa2V1id9U2HRo7PxI45zzF+aVByBpgKfESFQPK3Hvo
	TaCWOIEQplCKPP3dcdkK6t1vSVGfy0v8BiveB3CyNxZmVaT9Vqg4DLiEHkugwHQnRyNQ
	DJ/wLutKN1ovLN3vzWq5E27Ek3zXA3Bm9L97S7XZJFPc4+e6PRdodYIdZRAImR5smYEH
	taTfnSw7rgaxoFzad/JRKxhFEl05pdumSRmsdj+d4PoyhxFAt0vLg4kwiP/bqIFDYNn4
	BezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=GmXs4Hptum0OCMTs4Lg+blnGN9En8J1LIfR+b94m4K0=;
	b=VdU21T5C4K8T3ISZT47AoE4H9f0nvwhayDnMuNGaL4ZSs/mzfsRzLxIszY6rkavhFt
	iFKkLS9/AjGv931jEz44jOKXTcGYvSNYTxCTKH23ppGj5YvtbFQpColRgo1RoCfF7mtd
	nxY8iXPIwJNdiXuC1XwIwubjLS+06lx4KtvD6Ze6SzPHhcdyMLeNrPlqGIptdo5OPr5d
	kQelpa/LZpvycLr3nAoFRbLECHJ2VDs7CkaNvdianvRa5sSRaVw0YgdOaRrKqYUGgmli
	02WKOVl5zcs7hFHQFuHhZ7Xt793j0c/BadgBVz39WaipCpcSO+kbXZA4B339mEmBxrqJ
	Zhfw==
X-Gm-Message-State: APjAAAUxPhjLbqePl2DYh34pEXGBnel4rV2c0TnkObpeg3eZwyTGmH6V
	hISBOCLzXIqTkc1zI3EKJr51Yrem
X-Google-Smtp-Source: APXvYqwntH7t7wJGAWv4KvHMsdchr57VsU6Gd1ZXXaA5WTYzlndL+eYPG8pmDvDoeMiUZLOMU4agoA==
X-Received: by 2002:a24:2483:: with SMTP id
	f125mr15365051ita.123.1559750492466; 
	Wed, 05 Jun 2019 09:01:32 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	a129sm9382096ith.7.2019.06.05.09.01.31
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 09:01:32 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <8ceba717-542f-5898-d5d4-890945a022fb@gmail.com>
Date: Wed, 5 Jun 2019 10:01:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] integer overflow in dagtag_newer_eq(0, 1ULL<<63)
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

drbd_sender.c:maybe_send_unplug_remote() can assign (1ULL << 63) to unplug_dagtag_sector[i]:

1674                 connection->todo.unplug_dagtag_sector[connection->todo.unplug_slot] =
1675                         connection->send.current_dagtag_sector + (1ULL << 63);

Later it reaches dagtag_newer_eq(0, unplug_dagtag_sector[i]) which converts its arguments to
signed before subtracting.

272 #define dagtag_newer_eq(a,b)      \
273         (typecheck(u64, a) && \
274          typecheck(u64, b) && \
275         ((s64)(a) - (s64)(b) >= 0))

But (signed)(1ULL << 63) is the maximum negative integer, and the value of
(0 - (signed)(1ULL << 63)) cannot be represented.  So the subtraction ends in integer overflow.

drbd_sender.c:1660:9: runtime error: signed integer overflow: 0 - -9223372036854775808 cannot be represented in type 'long i

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
