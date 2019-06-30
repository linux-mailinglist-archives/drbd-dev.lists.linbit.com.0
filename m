Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA95B247
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2019 00:58:39 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 57E67103B4DE;
	Mon,  1 Jul 2019 00:58:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id A9AF71028A76
	for <drbd-dev@lists.linbit.com>; Mon,  1 Jul 2019 00:58:36 +0200 (CEST)
Received: by mail-io1-f53.google.com with SMTP id j6so24489523ioa.5
	for <drbd-dev@lists.linbit.com>; Sun, 30 Jun 2019 15:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:organization:to:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=WWModdcN4Iwk5Io7Bcx5BnbHmFdQ1WcX6XJ5Tg/lc7E=;
	b=SkzlwfiLQyAw6+FvC6bxBwzNPfnao/qI3ZTpEg5Dvk7XO9k8jgyEIclptXVbwlOq5E
	IxnaTwvAOBxoJ5yMwgYs0j36TSgKbaHmimgGKTrG9+F8YY/QyBimgvQhjYW0s+9DP0V5
	Iv0O6XYANItZHudUkKGsomU4kzZS5HAKr3hhJBviS8vlfuyuFeedgtSK5bNe3HsIKE/M
	8Uck1wx8ilZ5iotKOOST9zg99TqZNfrUYp8qXxwvCV3qHMv23c8+lHg/tN3s411zOnlZ
	vWnInJpYzqZj9D5QOEwJAFIQyhulAQP0V1YANxzA+dSYHYrcjT1sxBJvDUc0xyIIRGW3
	kbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:organization:to:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=WWModdcN4Iwk5Io7Bcx5BnbHmFdQ1WcX6XJ5Tg/lc7E=;
	b=VKzV9ctsBVviBZ+GYkFLiilK1Ta8cJo2neMQ+pa6gonZT4plgatQgwKwvOMfEMZURC
	+6l24A2wjPb5SeodCkN0aj9cEl8xYPUQ/oUHhznqsCbzugVz230pTYxM+azkcmMNKi3F
	xFSkjskOTCk1FLVgblNjJ08eo4CsgM8o04PHzl2I5jvhWprjJheMQs9Z+RR62/FGBvuW
	2e48CtNuVErfkY90XsU66PhtmTNEozn05sAljZRANztWS1I5JfxAaGEWlw+aBO8F+LW6
	eXbiSDvgSuiEqfaEOcw6ujmApsJZblrtFV2gQNzWzICXvKLfmtVweoNIWaMV2h00XY2b
	H3lA==
X-Gm-Message-State: APjAAAUHtLS7pxSKxh65GLyCeP7mM3nsyjICp+ldulo+qA7J/HOrgCMB
	/O/ElOzq86tvpFIsKdn632usDSz6
X-Google-Smtp-Source: APXvYqyHbe1un8GZvwLT0UT4lvD8rdnsRg61laPpSSV0PS5GUHkTVRLDsWsjZt6ap2Tnfun1mXCKMg==
X-Received: by 2002:a6b:c38b:: with SMTP id
	t133mr22624535iof.162.1561935515396; 
	Sun, 30 Jun 2019 15:58:35 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	e188sm10538897ioa.3.2019.06.30.15.58.34
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Jun 2019 15:58:34 -0700 (PDT)
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
To: drbd-dev@lists.linbit.com
Message-ID: <3b7dbdb2-3440-5b15-6da5-56e929afe1ff@gmail.com>
Date: Sun, 30 Jun 2019 16:58:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Drbd-dev] netlink transmit padding contains uninitialized bytes
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

Valgrind reported uninitialized bytes being sent to a system call when transmitting a netlink
response generated using drbd_msg_sprintf_info() (formatting opener_info()).  (Valgrind catches
this when the emulated kernel transmit function makes a real system call to do the transmit.)

When sending a text reply over netlink, the string is formatted directly into an skb area which
is reserved "big enough", then gets "trimmed" back down after the length of the string is known.
The "trim" is to an "aligned" size, possibly leaving up to three "alignment padding" bytes in
the skb data after the end of the string. 

Those "alignment padding" bytes were never initialized after the skb space was allocated,
leading to a complaint from valgrind when the uninitialized bytes were passed to a system call
for transmission over the netlink.  

The change below initializes any "alignment padding" bytes to zero, and makes the valgrind
complaint go away.  (It could be rewritten to use fewer CPU cycles!)
    
diff --git a/drbd/drbd_nl.c b/drbd/drbd_nl.c
index 7c4f3654..6a66528e 100644
--- a/drbd/drbd_nl.c
+++ b/drbd/drbd_nl.c
@@ -163,6 +163,12 @@ static int drbd_msg_sprintf_info(struct sk_buff *skb, const char *fmt, ...)

        /* maybe: retry with larger reserve, if truncated */
        txt->nla_len = nla_attr_size(len+1);
+   
+       /* avoid transmitting uninitialized bytes */
+       ++len;
+       while (len < NLA_ALIGN(len))
+               *((char *)nla_data(txt) + len++) = '\0';
+
        nlmsg_trim(skb, (char*)txt + NLA_ALIGN(txt->nla_len));
        nla_nest_end(skb, nla);
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
