Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727042802
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:22 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id EBE5C104B1A1;
	Wed, 12 Jun 2019 15:51:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 520591028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 18:15:29 +0200 (CEST)
Received: by mail-it1-f195.google.com with SMTP id l21so4377509ita.2
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=ugeR9vfrB8XUs1lDwOybAbqYQh5A8Y5tdlMO371vnmU=;
	b=UdaM3V1Iie9DUDbdAgfaOpSDfurKE38eX7ZD4CsBjgKoVdLwXCNn7MglgSJ1WJZMNh
	RTh6VWXMLv11oEhSjhkXiDbitUqLr8zlkRcYo/BxohacnQTYGuWwnmOBCq6pC6gaotfE
	vKN1XnvP0tDg+Le1iZp+YaNiF8zFennpGUY6D1MsMKpumGfY+FVlVSI9v/GQRQDhXTEe
	stFbzdYyqKilE6LAWVsqCf769wmkUq021jL9P/uUwUdzUTZXzbhKQrBGekAicBbWGBTw
	VfUX+s3K0hMUenVl9ojHazCnl5wXFBwqL+pJq+yJyR8UQmabRGHmrObtk5Qf34fAVw/M
	u2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=ugeR9vfrB8XUs1lDwOybAbqYQh5A8Y5tdlMO371vnmU=;
	b=K4zBtsgwsafETbnU1M9FsxWwSAeRUGLI0W0LFOdrWYMQmEhCyaq76sgAdAcFbdd792
	vh0Z+uWJNKTiL8OTh8cOrc0HWWBkErCdc5CT0AxDn9M9WHhDjDzntj05PrPI9UD0512U
	TZIW27Rg6dr8wJgzQv9neSxOoT6POlLKFrvEkTTSuPbx+iJkyzcfkAxViVIgYtYVF6Zh
	aFLnS4qogzGQCgxTfx/0Zi6E9rPc84wweT4rUQClBuyOulamRUK3uVIALAycH1b5648B
	YH491kWOfdmMXtVpTwDmf2DEW+Ol48qkUSOWEoqSurYSuP3wbC7DHF16fOBu11yvkYHl
	QxVA==
X-Gm-Message-State: APjAAAUWL+Dc9OA11+7reJJGeEmjRICmSCUquCm1Cb7LzkvTjucAocGn
	YDQbpxjbhwabKLY3JxDXfHVgRoa9
X-Google-Smtp-Source: APXvYqyMASAp/KYK3xDdDZ3RwhjnAS5V0TFlSPQ5hyphgY9BBkXuZPiYQqmF/QISswq6WlM9IGgjqA==
X-Received: by 2002:a02:29c4:: with SMTP id p187mr88050jap.7.1559751329005;
	Wed, 05 Jun 2019 09:15:29 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	l11sm1385633ioj.32.2019.06.05.09.15.28
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 09:15:28 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <28397d5c-72ca-e4b5-fb00-7b55466e7441@gmail.com>
Date: Wed, 5 Jun 2019 10:15:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] main.c comments
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

These three comments about main.c are the end of what I have on DRBD for now.

Three more things I noticed in drbd_main.c:

(1) Isn't the third argument to module_param_named() supposed to be the type of
    the second argument?  (But seems to require it as a single token??)

(2) The cast avoids a compiler warning about signed/unsigned comparison.

(3) q->queue_lock is needed by blk_queue_flag_set(), even if !defined(blk_queue_plugged),
    so I would move its initialization outside the #ifdef blk_queue_plugged.

diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index 4204deff..69245c57 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -146,7 +153,7 @@ const struct kernel_param_ops param_ops_drbd_protocol_version = {
 #endif

 unsigned int drbd_protocol_version_min = PRO_VERSION_MIN;
-module_param_named(protocol_version_min, drbd_protocol_version_min, drbd_protocol_version, 0644);
+module_param_named(protocol_version_min, drbd_protocol_version_min, uint, 0644);


 /* in 2.6.x, our device mapping and config info contains our virtual gendisks
@@ -1831,7 +1840,7 @@ static void dcbp_set_start(struct p_compressed_bm *p, int set)
 static void dcbp_set_pad_bits(struct p_compressed_bm *p, int n)
 {
        BUG_ON(n & ~0x7);
-       p->encoding = (p->encoding & (~0x7 << 4)) | (n << 4);
+       p->encoding = (p->encoding & ((unsigned)~0x7 << 4)) | (n << 4);
 }

 static int fill_bitmap_rle_bits(struct drbd_peer_device *peer_device,
@@ -3760,8 +3769,9 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 #ifdef COMPAT_HAVE_BLK_QUEUE_MERGE_BVEC
        blk_queue_merge_bvec(q, drbd_merge_bvec);
 #endif
+       q->queue_lock = &resource->req_lock; /* used by blk_queue_flag_set() */
 #ifdef blk_queue_plugged
-       q->queue_lock = &resource->req_lock; /* needed since we use */
+       /* needed since we use */
        /* plugging on a queue, that actually has no requests! */
        q->unplug_fn = drbd_unplug_fn;
 #endif
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
