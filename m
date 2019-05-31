Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F5F32B6F
	for <lists+drbd-dev@lfdr.de>; Mon,  3 Jun 2019 11:07:00 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 05B541028A6C;
	Mon,  3 Jun 2019 11:06:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id DE08F1028A64
	for <drbd-dev@lists.linbit.com>; Mon,  3 Jun 2019 11:06:57 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id w13so11129639wru.11
	for <drbd-dev@lists.linbit.com>; Mon, 03 Jun 2019 02:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:to:from:subject:organization:message-id
	:date:user-agent:mime-version:content-language
	:content-transfer-encoding;
	bh=v4JjTN5Jh/r7NpEkyPpBjakHs1AxOsFKWO2A/Msg+9o=;
	b=kC+e7cXxFJAj4Lb3g0zb5+hSC5+B/V6VOgpHB+tYAGTCFd5oEDepBPIetp/g0icOGr
	OVioToTaJqlwMAwpitxB/+Iwy/o9XHpQNvVwLyp/2MCtbKAgZjv1MqClT9id3hp88Gwr
	7orPcDutQkNq8KQvL4FdQs5hvcNwm6djJiV4Nhds5TgQtPrdutNP0HBDNvHvrRWOA5bx
	2JyIYsr42GEozUuMo7s5cSpzUC3Z1Rmx3+xHmkfRMk39vwsib5EY2uJBfk8yKuGcL06B
	QfLeyPqf4mAFFKwuOsn6qMeHNKugOQz9y7m8OVsRa8wHrh04XVpMM+TOkCBky92bKN+1
	GGFQ==
X-Gm-Message-State: APjAAAW0bBt1VimDxrJzt4YB11fVmMUBOejU4xoOmAmo84PSKxFsxta/
	dNJ9uYUF8LF0sRkE+HNZo/o4Xm6d+f5yQA==
X-Google-Smtp-Source: APXvYqzUULW3QPAVRCZiIWBFgqLOMtp9XnVWnmkjLkcJwBC2FBO3dW7/jlxOw/qd2u01nnhj8XJIOg==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr1635808wrm.100.1559552816885; 
	Mon, 03 Jun 2019 02:06:56 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	e13sm15107777wra.16.2019.06.03.02.06.56
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jun 2019 02:06:56 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 3 Jun 2019 11:06:54 +0200
Resent-Message-ID: <20190603090654.GG5803@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 421 seconds by postgrey-1.31 at mail09;
	Fri, 31 May 2019 21:08:29 CEST
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 0D23A1011B9A
	for <drbd-dev@lists.linbit.com>; Fri, 31 May 2019 21:08:28 +0200 (CEST)
Received: by mail-io1-f43.google.com with SMTP id k8so9139953iot.1
	for <drbd-dev@lists.linbit.com>; Fri, 31 May 2019 12:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=v4JjTN5Jh/r7NpEkyPpBjakHs1AxOsFKWO2A/Msg+9o=;
	b=ew3x7QqBVOoV6lhw2eIao9pyLAz/xawwyxMaxGsK4Q9ndQNzzMqb5RjFBu3d5lnA2/
	1xvlpqpKhe8Pdh9a4qoGCXzUMA+KrdVMQcLtAeV+YMnARnuc3zeiJTe8nlKx8iNJL6hX
	6dpLqsthBnag8thpuV3blQzOM6XCJqLw7IGQg8PzkGE4T/9g1OHRPxGCQT7Efwo3fy4y
	/Lv1HCstciZqCOjcZxMaEiDPtici1T1xL1kkmXAoveOKnxgspN3NT3b2bqFn7xu6gBPo
	S/qum3YolteNQtcviy2Pey+NC1dZcN9dQd2nKmmuri9hjHj26wB1mQh/5WMSLqHbx87p
	jCvQ==
X-Received: by 2002:a5d:9dc7:: with SMTP id 7mr540783ioo.237.1559329287073;
	Fri, 31 May 2019 12:01:27 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	o192sm2828981itb.0.2019.05.31.12.01.25
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 12:01:26 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
Date: Fri, 31 May 2019 13:01:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Drbd-dev] drbd_nl.c:drbd_adm_prepare() indexes drbd_genl_ops[] by
	cmd number
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

(Is this the right place to send comments on the source code such as this one?)

In drbd_nl.c:

  static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
  	struct sk_buff *skb, struct genl_info *info, unsigned flags)
  {
  	struct drbd_genlmsghdr *d_in = info->userhdr;
  	const u8 cmd = info->genlhdr->cmd;
  	int err;
  
  	memset(adm_ctx, 0, sizeof(*adm_ctx));
  
+ 	//XXX I do not think you can find the ops for a command number by indexing this array.
+ 	//XXX The array is unordered and packed.  I think it must search like genl_get_cmd().
  	/*
  	 * genl_rcv_msg() only checks if commands with the GENL_ADMIN_PERM flag
  	 * set have CAP_NET_ADMIN; we also require CAP_SYS_ADMIN for
  	 * administrative commands.
  	 */
  	if ((drbd_genl_ops[cmd].flags & GENL_ADMIN_PERM) &&
  	    drbd_security_netlink_recv(skb, CAP_SYS_ADMIN))
  		return -EPERM;
  
  	adm_ctx->reply_skb = genlmsg_new(NLMSG_GOODSIZE, GFP_KERNEL);
  	if (!adm_ctx->reply_skb) {
  		err = -ENOMEM;
  		goto fail;
  	}
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
